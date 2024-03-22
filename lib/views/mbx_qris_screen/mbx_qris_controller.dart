import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MbxQRISController extends GetxController {
  Barcode? capture;
  MobileScannerController cameraController = MobileScannerController();
  var flashlight = false;
  @override
  void onReady() {
    super.onReady();
  }

  btnBackClicked() {
    Get.back();
  }

  btnImageClicked() {}

  btnFlashlightClicked() {
    cameraController.toggleTorch();
    flashlight = !flashlight;
    update();
  }
}
