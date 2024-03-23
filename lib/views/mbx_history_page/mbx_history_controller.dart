import 'package:get/get.dart';

import '../../viewmodels/mbx_history_list_vm.dart';

class MbxHistoryController extends GetxController {
  var historyListVM = MbxHistoryListVM();

  @override
  void onReady() {
    super.onReady();
    nextPage();
  }

  btnBackClicked() {
    Get.back();
  }

  nextPage() {
    update();
    historyListVM.nextPage().then((resp) {
      update();
    });
  }
}
