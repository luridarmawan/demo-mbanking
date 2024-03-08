import '../../utils/all_utils.dart';
import '../../viewmodels/demo_anti_jailbreak_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_bottom_navbar_screen/mbx_bottom_navbar_screen.dart';
import '../mbx_login_otp_sheet/mbx_login_otp_sheet.dart';

class MbxLoginController extends SuperController {
  final txtPhoneController = TextEditingController();
  final txtPhoneNode = FocusNode();
  var txtPhoneError = '';
  var loginEnabled = false;

  @override
  void onReady() {
    super.onReady();
    txtPhoneError = '';
    update();
    FocusScope.of(Get.context!).requestFocus(txtPhoneNode);
  }

  btnBackClicked() {
    Get.back();
  }

  @override
  void onDetached() {
    LoggerX.log('[MbxLoginController] onDetached');
  }

  @override
  void onInactive() {
    LoggerX.log('[MbxLoginController] onInactive');
  }

  @override
  void onPaused() {
    LoggerX.log('[MbxLoginController] onPaused');
  }

  @override
  Future<void> onResumed() async {
    LoggerX.log('[MbxLoginController] onResumed');
    //await DemoAntiJailbreakVM.check();
  }

  txtPhoneOnChanged(String value) {
    loginEnabled = !value.isEmpty;
    update();
  }

  btnLoginClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    txtPhoneError = '';
    update();

    if (txtPhoneController.text.trim().isEmpty) {
      txtPhoneError = 'Username cannot be empty.';
      FocusScope.of(Get.context!).requestFocus(txtPhoneNode);
      update();
      return;
    }

    final sheet = MbxLoginOtpSheet();
    sheet.show().then((value) {
      LoggerX.log('OTP: $value');
      if (value != null) {
        Get.deleteAll();
        Get.offAll(MbxBottomNavBarScreen());
      }
    });
  }

  @override
  void onHidden() {}
}
