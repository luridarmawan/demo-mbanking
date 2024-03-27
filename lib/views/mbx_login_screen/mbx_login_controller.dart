import '../../utils/all_utils.dart';
import '../../viewmodels/mbx_login_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_bottom_navbar_screen/mbx_bottom_navbar_screen.dart';
import '../mbx_otp_sheet/mbx_otp_sheet.dart';

class MbxLoginController extends SuperController {
  final txtPhoneController = TextEditingController();
  final txtPhoneNode = FocusNode();
  var txtPhoneError = '';
  var loginEnabled = false;

  @override
  void onReady() {
    super.onReady();
    txtPhoneError = '';
    update();
    FocusScope.of(Get.context!).requestFocus(txtPhoneNode);
  }

  btnBackClicked() {
    Get.back();
  }

  @override
  void onDetached() {
    LoggerX.log('[MbxLoginController] onDetached');
  }

  @override
  void onInactive() {
    LoggerX.log('[MbxLoginController] onInactive');
  }

  @override
  void onPaused() {
    LoggerX.log('[MbxLoginController] onPaused');
  }

  @override
  Future<void> onResumed() async {
    LoggerX.log('[MbxLoginController] onResumed');
    //await MbxAntiJailbreakVM.check();
  }

  txtPhoneOnChanged(String value) {
    loginEnabled = !value.isEmpty;
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
    MbxLoginVM.request(phone: txtPhoneController.text).then((resp) {
      Get.back();
      if (resp.statusCode == 200) {
        final sheet = MbxOtpSheet(
          title: 'Masukkan OTP',
          phone: txtPhoneController.text,
        );
        sheet.show().then((value) {
          LoggerX.log('OTP: $value');
          if (value != null) {
            Get.loading();
            MbxProfileVM.request().then((resp) {
              Get.back();
              Get.deleteAll();
              Get.offAll(MbxBottomNavBarScreen());
            });
          }
        });
      } else {}
    });
  }

  @override
  void onHidden() {}
}
