import 'package:demombanking/viewmodels/mbx_promo_list_vm.dart';
import 'package:get/get.dart';

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

  btnBackClicked() {
    Get.back();
  }

  setPageIndex(int index) {
    pageIndex = index;
  }
}
