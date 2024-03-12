import 'package:demombanking/viewmodels/mbx_session_vm.dart';
import 'package:demombanking/views/mbx_onboarding_screen/mbx_onboarding_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';

class DemoProfileController extends GetxController {
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

  btnSignOutClicked() {
    MbxSessionVM.logout();
    Get.deleteAll();
    Get.offAll(MbxOnboardingScreen());
  }
}
