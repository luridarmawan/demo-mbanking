import 'package:package_info_plus/package_info_plus.dart';
import '../../viewmodels/mbx_logout_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxProfileController extends GetxController {
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

  btnLogoutClicked() {
    Get.loading();
    MbxLogoutVM.request().then((resp) {
      Get.back();
      MbxProfileVM.logout();
    });
  }
}
