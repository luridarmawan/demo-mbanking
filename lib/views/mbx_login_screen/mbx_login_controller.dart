import 'package:demombanking/views/demo_screen/demo_screen.dart';

import '../../utils/all_utils.dart';
import '../../viewmodels/demo_anti_jailbreak_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxLoginController extends SuperController {
  final txtUsernameController = TextEditingController();
  final txtUsernameNode = FocusNode();
  var txtUsernameError = '';

  @override
  void onReady() {
    super.onReady();
    txtUsernameError = '';
    update();
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
    await DemoAntiJailbreakVM.check();
  }

  btnLoginClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    txtUsernameError = '';
    update();

    if (txtUsernameController.text.trim().isEmpty) {
      txtUsernameError = 'Username cannot be empty.';
      FocusScope.of(Get.context!).requestFocus(txtUsernameNode);
      update();
      return;
    }

    Get.to(DemoScreen());
  }

  @override
  void onHidden() {}
}
