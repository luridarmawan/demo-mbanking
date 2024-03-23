import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewmodels/mbx_onboarding_list_vm.dart';
import '../mbx_login_screen/mbx_login_screen.dart';

class MbxOnboardingController extends GetxController {
  final PageController pageController = PageController();
  var onboardingVM = MbxOnboardingListVM();

  @override
  void onReady() {
    super.onReady();
    onboardingVM.nextPage().then((resp) {
      if (resp.statusCode == 200) {
        update();
      }
    });
  }

  btnStartClicked() {
    Get.to(MbxLoginScreen());
  }
}
