import '../../../utils/all_utils.dart';
import '../../viewmodels/demo_anti_jailbreak_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxHomeController extends SuperController {
  int tabBarIndex = 0;
  MbxHomeController({this.tabBarIndex = 0});

  @override
  void onReady() {
    super.onReady();
    StatusBarX.setDark();
  }

  @override
  void onDetached() {
    LoggerX.log('[MbxHomeController] onDetached');
  }

  @override
  void onInactive() {
    LoggerX.log('[MbxHomeController] onInactive');
  }

  @override
  void onPaused() {
    LoggerX.log('[MbxHomeController] onPaused');
  }

  @override
  Future<void> onResumed() async {
    LoggerX.log('[MbxHomeController] onResumed');
    await DemoAntiJailbreakVM.check();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onChange(int index) {
    LoggerX.log('MbxHomeController.onChange: $index');
    tabBarIndex = index;
    update();

    switch (index) {
      case 0:
        StatusBarX.setLight();
        //final HomeController controller = Get.find();
        //controller.reloadAll();
        break;
      case 1:
        StatusBarX.setLight();
        break;
      case 2:
        StatusBarX.setLight();
        break;
    }
  }
  
  @override
  void onHidden() {
  }
}
