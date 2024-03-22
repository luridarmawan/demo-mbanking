import 'package:demombanking/viewmodels/mbx_profile_vm.dart';
import 'package:demombanking/viewmodels/mbx_promo_list_vm.dart';
import 'package:demombanking/views/mbx_bottom_navbar_screen/mbx_bottom_navbar_controller.dart';
import 'package:demombanking/views/mbx_theme_sheet/mbx_theme_sheet.dart';
import 'package:get/get.dart';
import '../../utils/all_utils.dart';
import '../../widgets/all_widgets.dart';

class MbxHomeController extends GetxController {
  var movieListVM = MbxPromoListVM();
  var pageIndex = 0;

  @override
  void onReady() {
    super.onReady();
    movieListVM.nextPage().then((resp) {
      if (resp.statusCode == 200) {
        update();
      }
    });
  }

  btnThemeClicked() {
    final sheet = MbxThemeSheet();
    sheet.show().then((value) {
      LoggerX.log('hex: $value');
      ColorX.theme = hexToColor(value);
      update();

      Get.find<MbxBottomNavBarController>().update();
    });
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(3, 9), radix: 16) + 0xFF000000);
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
