import 'package:demombanking/widgets/all_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../utils/all_utils.dart';
import '../../viewmodels/mbx_login_vm.dart';
import '../../viewmodels/mbx_onboarding_list_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../mbx_bottom_navbar_screen/mbx_bottom_navbar_screen.dart';
import 'mbx_login_screen.dart';
import '../mbx_otp_sheet/mbx_otp_sheet.dart';

class MbLoginController extends GetxController {
  final PageController pageController = PageController();
  var onboardingVM = MbxOnboardingListVM();
  final txtPhoneController = TextEditingController();
  final txtPhoneNode = FocusNode();
  var txtPhoneError = '';
  var loginEnabled = false;
  var version = '';

  @override
  void onReady() {
    super.onReady();
    PackageInfo.fromPlatform().then((info) {
      version = 'Version ${info.version}.${info.buildNumber}';
      update();
    });

    onboardingVM.nextPage().then((resp) {
      if (resp.statusCode == 200) {
        update();
      }
    });
  }

  txtPhoneOnChanged(String value) {
    loginEnabled = !value.isEmpty;
    update();
  }

  btnStartClicked() {
    Get.to(MbxLoginScreen());
  }

  btnLoginClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    txtPhoneError = '';
    update();

    if (txtPhoneController.text.trim().isEmpty) {
      txtPhoneError = 'Nomor handphone tidak boleh kosong.';
      FocusScope.of(Get.context!).requestFocus(txtPhoneNode);
      update();
      return;
    }

    Get.loading();
    MbxLoginVM.request(phone: txtPhoneController.text).then((resp) {
      Get.back();
      if (resp.statusCode == 200) {
        final sheet = MbxOtpSheet(
          title: 'Masukkan OTP',
          phone: txtPhoneController.text,
        );
        sheet.show().then((value) {
          LoggerX.log('OTP: $value');
          if (value != null) {
            Get.loading();
            MbxProfileVM.request().then((resp) {
              Get.back();
              Get.deleteAll();
              Get.offAll(MbxBottomNavBarScreen());
            });
          }
        });
      } else {}
    });
  }
}
