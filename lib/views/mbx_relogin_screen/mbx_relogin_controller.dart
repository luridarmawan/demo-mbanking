import 'package:package_info_plus/package_info_plus.dart';
import '../../utils/all_utils.dart';
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
    final sheet = MbxPinSheet(
      title: 'PIN',
      description: 'Masukkan nomor pin m-banking atau ATM anda.',
    );
    sheet.show().then((value) {
      LoggerX.log('PIN: $value');
      if (value != null) {
        Get.loading();
        MbxProfileVM.request().then((resp) {
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
