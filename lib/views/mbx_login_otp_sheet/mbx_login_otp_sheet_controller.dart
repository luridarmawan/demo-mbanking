import '../../widgets/all_widgets.dart';

class MbxLoginOtpSheetController extends GetxController {
  String otp = '';
  String error = '';

  btnCloseClicked() {
    Get.back();
  }

  btnKeypadClicked(String digit) {
    if (otp.length < 6) {
      otp = otp + digit;
      if (otp.length == 6) {
        submit();
      }
    }
    update();
  }

  btnFingerprintClicked() {}

  btnBackspaceClicked() {
    if (otp.length > 0) {
      otp = otp.substring(0, otp.length - 1);
    }
    update();
  }

  btnResendClicked() {
    Get.back(result: '');
  }

  clear(String error) {
    otp = '';
    this.error = error;
    update();
  }

  submit() {
    Get.loading();
    Future.delayed(Duration(milliseconds: 2000), () {
      Get.back();
      Get.back(result: otp);
    });
  }
}
