import 'package:get/get.dart';

import '../../viewmodels/mbx_notification_list_vm.dart';

class MbxNotificationController extends GetxController {
  var notificationListVM = MbxNotificationVM();

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
    notificationListVM.nextPage().then((resp) {
      update();
    });
  }
}
