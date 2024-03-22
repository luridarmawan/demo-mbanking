import 'package:demombanking/viewmodels/mbx_profile_vm.dart';
import 'package:demombanking/viewmodels/mbx_promo_list_vm.dart';
import 'package:get/get.dart';
import '../../utils/all_utils.dart';
import '../demo_pin_sheet/demo_pin_sheet.dart';

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
    final sheet = DemoPinSheet();
    sheet.show().then((value) {
      LoggerX.log('PIN: $value');
    });
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
