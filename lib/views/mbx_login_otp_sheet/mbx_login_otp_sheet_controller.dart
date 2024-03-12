import '../../viewmodels/mbx_login_otp_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxLoginOtpSheetController extends GetxController {
  final String phone;
  String otp = '';
  String error = '';

  MbxLoginOtpSheetController({required this.phone});

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
    MbxLoginOtpVM.request(phone: phone, otp: otp).then((resp) {
      Get.back();
      if (resp.statusCode == 200) {
        Get.back(result: otp);
      } else {}
    });
  }
}
