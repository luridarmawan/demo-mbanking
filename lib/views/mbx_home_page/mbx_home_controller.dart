import 'package:demombanking/views/mbx_lock_screen/mbx_lock_screen.dart';

import '../../utils/all_utils.dart';
import '../../viewmodels/mbx_news_list_vm.dart';
import '../../viewmodels/mbx_preferences_vm+users.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_bottom_navbar_screen/mbx_bottom_navbar_controller.dart';
import '../mbx_theme_sheet/mbx_theme_sheet.dart';

class MbxHomeController extends GetxController {
  var newsListVM = MbxNewsListVM();
  var pageIndex = 0;

  @override
  void onReady() {
    super.onReady();
    newsListVM.nextPage().then((resp) {
      if (resp.statusCode == 200) {
        update();
      }
    });
  }

  btnThemeClicked() {
    final sheet = MbxThemeSheet();
    sheet.show().then((value) {
      LoggerX.log('hex: $value');
      MbxUserPreferencesVM.setTheme(value);
      ColorX.theme = hexToColor(value);
      update();

      Get.find<MbxBottomNavBarController>().update();
    });
  }

  btnLockClicked() {
    Get.deleteAll();
    Get.offAll(MbxLockScreen());
  }

  btnEyeClicked(int index) {
    MbxProfileVM.profile.accounts[index].visible =
        !MbxProfileVM.profile.accounts[index].visible;
    update();
  }

  btnBackClicked() {
    Get.back();
  }

  setPageIndex(int index) {
    pageIndex = index;
  }
}
