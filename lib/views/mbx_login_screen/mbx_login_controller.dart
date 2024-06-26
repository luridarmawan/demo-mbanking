import 'package:demombanking/views/mbx_pin_sheet/mbx_pin_sheet.dart';
import 'package:demombanking/widgets/all_widgets.dart';
import 'package:flash/flash_helper.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../utils/all_utils.dart';
import '../../viewmodels/mbx_login_otp_vm.dart';
import '../../viewmodels/mbx_login_phone_vm.dart';
import '../../viewmodels/mbx_login_pin_vm.dart';
import '../../viewmodels/mbx_onboarding_list_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../viewmodels/mbx_theme_vm.dart';
import '../mbx_bottom_navbar_screen/mbx_bottom_navbar_screen.dart';
import 'mbx_login_screen.dart';
import '../mbx_otp_sheet/mbx_otp_sheet.dart';

class MbLoginController extends GetxController {
  final PageController pageController = PageController();
  var onboardingVM = MbxOnboardingListVM();
  final txtPhoneController = TextEditingController();
  final txtPhoneNode = FocusNode();
  var txtPhoneError = '';
  var loginEnabled = false;
  var version = '';
  var pageIndex = 0;

  @override
  void onReady() {
    super.onReady();
    PackageInfo.fromPlatform().then((info) {
      version = 'Version ${info.version}.${info.buildNumber}';
      update();
    });

    onboardingVM.nextPage().then((resp) {
      if (resp.status == 200) {
        update();
      }
    });
  }

  btnThemeClicked() {
    MbxThemeVM.change().then((value) {
      update();
    });
  }

  txtPhoneOnChanged(String value) {
    loginEnabled = !value.isEmpty;
    update();
  }

  btnStartClicked() {
    Get.to(MbxLoginScreen());
  }

  setPageIndex(int index) {
    pageIndex = index;
    update();
  }

  btnLoginClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    txtPhoneError = '';
    update();

    if (txtPhoneController.text.trim().isEmpty) {
      txtPhoneError = 'Nomor handphone tidak boleh kosong.';
      FocusScope.of(Get.context!).requestFocus(txtPhoneNode);
      update();
      return;
    }

    Get.loading();
    MbxLoginPhoneVM.request(phone: txtPhoneController.text).then((resp) {
      Get.back();
      if (resp.status == 200) {
        askOtp(txtPhoneController.text);
      } else {
        SheetX.showMessage(
          title: 'Login',
          message: resp.message,
          leftBtnTitle: 'OK',
          onLeftBtnClicked: () {
            Get.back();
          },
        );
      }
    });
  }

  askOtp(String phone) {
    MbxOtpSheet.show(
      title: 'OTP',
      description: 'Masukkan kode OTP yang anda terima melalui SMS.',
      onSubmit: (code) async {
        LoggerX.log('[OTP] entered: $code');
        Get.loading();
        final resp = await MbxLoginOtpVM.request(phone: phone, otp: code);
        Get.back();
        if (resp.status == 200) {
          return true;
        } else {
          return false;
        }
      },
      onResend: () async {
        Get.loading();
        MbxLoginPhoneVM.request(phone: txtPhoneController.text).then((resp) {
          Get.back();
          if (resp.status == 200) {
            ToastX.snackBar(msg: 'OTP telah dikirim ulang.');
          }
        });
      },
    ).then((code) {
      if (code != null && (code as String).isNotEmpty) {
        LoggerX.log('[OTP] verfied: $code');
        askPin(phone, code);
      }
    });
  }

  askPin(String phone, String otp) {
    MbxPinSheet.show(
        title: 'PIN',
        description: 'Masukkan nomor pin m-banking atau ATM anda.',
        onSubmit: (code) async {
          LoggerX.log('[PIN] entered: $code');
          Get.loading();
          final resp =
              await MbxLoginPinVM.request(phone: phone, otp: otp, pin: code);
          Get.back();
          if (resp.status == 200) {
            return true;
          } else {
            return false;
          }
        }).then((code) {
      if (code != null && (code as String).isNotEmpty) {
        LoggerX.log('[PIN] verfied: $code');
        Get.loading();
        MbxProfileVM.request().then((resp) {
          Get.back();
          Get.deleteAll();
          Get.offAll(MbxBottomNavBarScreen());
        });
      }
    });
  }
}
