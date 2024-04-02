import '../../viewmodels/mbx_receipt_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxReceiptController extends GetxController {
  var receiptVM = MbxReceiptVM();

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
    receiptVM.nextPage().then((resp) {
      update();
    });
  }
}
