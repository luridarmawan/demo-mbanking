import '../../widgets/all_widgets.dart';

class MbxPinSheetController extends GetxController {
  final Future<bool> Function(String code) onSubmit;
  String code = '';
  String error = '';

  MbxPinSheetController({required this.onSubmit});

  btnCloseClicked() {
    Get.back();
  }

  btnKeypadClicked(String digit) async {
    if (code.length < 6) {
      code = code + digit;
      if (code.length == 6) {
        final result = await onSubmit(code);
        if (result == true) {
          Get.back(result: code);
        } else {
          clear(error);
        }
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

  btnForgotClicked() {}

  clear(String error) {
    code = '';
    this.error = error;
    update();
  }
}
