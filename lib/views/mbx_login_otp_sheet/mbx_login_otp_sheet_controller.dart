import '../../viewmodels/mbx_login_otp_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxLoginOtpSheetController extends GetxController {
  final String phone;
  String code = '';
  String error = '';

  MbxLoginOtpSheetController({required this.phone});

  btnCloseClicked() {
    Get.back();
  }

  btnKeypadClicked(String digit) {
    if (code.length < 6) {
      code = code + digit;
      if (code.length == 6) {
        submit();
      }
    }
    update();
  }

  btnFingerprintClicked() {}

  btnBackspaceClicked() {
    if (code.length > 0) {
      code = code.substring(0, code.length - 1);
    }
    update();
  }

  btnResendClicked() {
    Get.back(result: '');
  }

  clear(String error) {
    code = '';
    this.error = error;
    update();
  }

  submit() {
    Get.loading();
    MbxLoginOtpVM.request(phone: phone, otp: code).then((resp) {
      Get.back();
      if (resp.statusCode == 200) {
        Get.back(result: code);
      } else {}
    });
  }
}
