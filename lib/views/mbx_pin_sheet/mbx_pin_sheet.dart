import '../../widgets/all_widgets.dart';
import 'mbx_pin_dot.dart';
import 'mbx_pin_sheet_controller.dart';
import 'mbx_pin_button.dart';

// ignore: must_be_immutable
class MbxPinSheet extends GetWidget<MbxPinSheetController> {
  final String title;
  final String description;
  TextEditingController pinController = TextEditingController();

  MbxPinSheet({required this.title, required this.description});

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showWithGrip(
        backgroundColor: const Color.fromARGB(255, 130, 102, 102),
        cornerRadius: 16.0,
        widget: this,
        title: title);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxPinSheetController>(
        init: MbxPinSheetController(phone: ''),
        builder: (controller) => ContainerX(
            backgroundColor: ColorX.white,
            topLeftRadius: 32.0,
            topRightRadius: 32.0,
            child: Wrap(alignment: WrapAlignment.center, children: [
              Visibility(
                visible: description.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.only(left: 48.0, right: 48.0),
                  child: TextX(
                    description,
                    color: ColorX.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ),
              ContainerX(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MbxPinDot(on: controller.code.length >= 1),
                  ContainerX(width: 8.0),
                  MbxPinDot(on: controller.code.length >= 3),
                  ContainerX(width: 8.0),
                  MbxPinDot(on: controller.code.length >= 3),
                  ContainerX(width: 8.0),
                  MbxPinDot(on: controller.code.length >= 4),
                  ContainerX(width: 8.0),
                  MbxPinDot(on: controller.code.length >= 5),
                  ContainerX(width: 8.0),
                  MbxPinDot(on: controller.code.length >= 6),
                ],
              ),
              ContainerX(height: 16.0),
              Visibility(
                visible: controller.error.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.only(left: 48.0, right: 48.0),
                  child: TextX(
                    controller.error,
                    color: ColorX.red,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ),
              ContainerX(
                backgroundColor: ColorX.transparent,
                padding: EdgeInsets.only(
                    left: 16.0, top: 0.0, right: 16.0, bottom: 0.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MbxInButton(
                          title: '1',
                          onClicked: () {
                            controller.btnKeypadClicked('1');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxInButton(
                          title: '2',
                          onClicked: () {
                            controller.btnKeypadClicked('2');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxInButton(
                          title: '3',
                          onClicked: () {
                            controller.btnKeypadClicked('3');
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    Row(
                      children: [
                        MbxInButton(
                          title: '4',
                          onClicked: () {
                            controller.btnKeypadClicked('4');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxInButton(
                          title: '5',
                          onClicked: () {
                            controller.btnKeypadClicked('5');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxInButton(
                          title: '6',
                          onClicked: () {
                            controller.btnKeypadClicked('6');
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    Row(
                      children: [
                        MbxInButton(
                          title: '7',
                          onClicked: () {
                            controller.btnKeypadClicked('7');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxInButton(
                          title: '8',
                          onClicked: () {
                            controller.btnKeypadClicked('8');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxInButton(
                          title: '9',
                          onClicked: () {
                            controller.btnKeypadClicked('9');
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    Row(
                      children: [
                        MbxInButton(
                          faIcon: FontAwesomeIcons.fingerprint,
                          onClicked: () {
                            controller.btnFingerprintClicked();
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxInButton(
                          title: '0',
                          onClicked: () {
                            controller.btnKeypadClicked('0');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxInButton(
                          faIcon: FontAwesomeIcons.deleteLeft,
                          onClicked: () {
                            controller.btnBackspaceClicked();
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    ButtonX(
                      title: 'Kirim Ulang?',
                      titleColor: ColorX.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      backgroundColor: ColorX.transparent,
                      width: 120.0,
                      height: 32.0,
                      cornerRadius: 8.0,
                      onClicked: () {
                        controller.btnResendClicked();
                      },
                    ),
                    ContainerX(
                        height: MediaQuery.of(Get.context!).padding.bottom)
                  ],
                ),
              ),
            ])));
  }
}
