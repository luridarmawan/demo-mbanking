import 'package:demombanking/viewmodels/mbx_onboarding_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MbxOnboardingController extends GetxController {
  final PageController pageController = PageController();
  var onboardingVM = MbxOnboardingVM();

  @override
  void onReady() {
    super.onReady();
    onboardingVM.nextPage().then((resp) {
      if (resp.statusCode == 200) {
        update();
      }
    });
  }

  btnBackClicked() {
    Get.back();
  }
}
