import 'package:package_info_plus/package_info_plus.dart';
import '../../utils/all_utils.dart';
import '../../viewmodels/mbx_login_pin_vm.dart';
import '../../viewmodels/mbx_logout_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../viewmodels/mbx_theme_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_bottom_navbar_screen/mbx_bottom_navbar_screen.dart';
import '../mbx_pin_sheet/mbx_pin_sheet.dart';

class MbxReloginController extends GetxController {
  var version = '';

  @override
  void onReady() {
    super.onReady();
    PackageInfo.fromPlatform().then((info) {
      version = 'Version ${info.version}.${info.buildNumber}';
      update();
    });
    MbxProfileVM.request().then((resp) {
      update();
    });
  }

  btnThemeClicked() {
    MbxThemeVM.change().then((value) {
      update();
    });
  }

  btnLoginClicked() {
    MbxPinSheet.show(
        title: 'PIN',
        description: 'Masukkan nomor pin m-banking atau ATM anda.',
        onSubmit: (code) async {
          LoggerX.log('[PIN] entered: $code');
          Get.loading();
          final resp =
              await MbxLoginPinVM.request(phone: '', otp: '', pin: code);
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

  btnSwitchAccountClicked() {
    SheetX.showMessage(
        title: 'Keluar',
        message: 'Apakah anda yakin ?',
        leftBtnTitle: 'Ya',
        onLeftBtnClicked: () {
          Get.loading();
          MbxLogoutVM.request().then((resp) {
            Get.back();
            MbxProfileVM.logout();
          });
        },
        rightBtnTitle: 'Batal',
        onRightBtnClicked: () {
          Get.back();
        });
  }
}
