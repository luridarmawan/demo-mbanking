import '../../../utils/all_utils.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_qris_screen/mbx_qris_screen.dart';

class MbxBottomNavBarController extends SuperController {
  int tabBarIndex = 0;
  MbxBottomNavBarController({this.tabBarIndex = 0});

  @override
  void onReady() {
    super.onReady();
    StatusBarX.setDark();
  }

  @override
  void onDetached() {
    LoggerX.log('[MbxBottomNavBarController] onDetached');
  }

  @override
  void onInactive() {
    LoggerX.log('[MbxBottomNavBarController] onInactive');
  }

  @override
  void onPaused() {
    LoggerX.log('[MbxBottomNavBarController] onPaused');
  }

  @override
  Future<void> onResumed() async {
    LoggerX.log('[MbxBottomNavBarController] onResumed');
    //await DemoAntiJailbreakVM.check();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onChange(int index) {
    LoggerX.log('MbxBottomNavBarController.onChange: $index');
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
