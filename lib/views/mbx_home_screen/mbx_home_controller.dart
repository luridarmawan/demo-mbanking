import 'package:demombanking/views/demo_qr_scan_screen/demo_qr_scan_screen.dart';
import 'package:demombanking/views/mbx_qris_screen/mbx_qris_screen.dart';

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

    switch (index) {
      case 0: // Beranda
        StatusBarX.setLight();
        //final HomeController controller = Get.find();
        //controller.reloadAll();
        update();
        break;
      case 1: // QRIS
        Get.to(MbxQRISScreen());
        break;
      case 2: // Riwayat
        StatusBarX.setLight();
        update();
        break;
      case 3: // Akun Saya
        StatusBarX.setLight();
        update();
        break;
    }
  }

  @override
  void onHidden() {}
}
