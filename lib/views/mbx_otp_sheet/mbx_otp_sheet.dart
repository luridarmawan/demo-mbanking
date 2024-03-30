import '../../widgets/all_widgets.dart';
import 'mbx_otp_sheet_controller.dart';
import 'mbx_otp_button.dart';

// ignore: must_be_immutable
class MbxOtpSheet extends GetWidget<MbxOtpSheetController> {
  final String title;
  final String phone;
  TextEditingController pinController = TextEditingController();

  MbxOtpSheet({required this.title, required this.phone});

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showWithGrip(
        backgroundColor: const Color.fromARGB(255, 130, 102, 102),
        cornerRadius: 16.0,
        widget: this,
        title: 'Masukkan OTP');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxOtpSheetController>(
        init: MbxOtpSheetController(phone: phone),
        builder: (controller) => ContainerX(
            backgroundColor: ColorX.white,
            topLeftRadius: 32.0,
            topRightRadius: 32.0,
            child: Wrap(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerX(
                    backgroundColor: controller.code.length >= 1
                        ? ColorX.gray
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.gray,
                  ),
                  ContainerX(width: 8.0),
                  ContainerX(
                    backgroundColor: controller.code.length >= 2
                        ? ColorX.gray
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.gray,
                  ),
                  ContainerX(width: 8.0),
                  ContainerX(
                    backgroundColor: controller.code.length >= 3
                        ? ColorX.gray
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.gray,
                  ),
                  ContainerX(width: 8.0),
                  ContainerX(
                    backgroundColor: controller.code.length >= 4
                        ? ColorX.gray
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.gray,
                  ),
                  ContainerX(width: 8.0),
                  ContainerX(
                    backgroundColor: controller.code.length >= 5
                        ? ColorX.gray
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.gray,
                  ),
                  ContainerX(width: 8.0),
                  ContainerX(
                    backgroundColor: controller.code.length >= 6
                        ? ColorX.gray
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.gray,
                  ),
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
                        MbxOtpButton(
                          title: '1',
                          onClicked: () {
                            controller.btnKeypadClicked('1');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          title: '2',
                          onClicked: () {
                            controller.btnKeypadClicked('2');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
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
                        MbxOtpButton(
                          title: '4',
                          onClicked: () {
                            controller.btnKeypadClicked('4');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          title: '5',
                          onClicked: () {
                            controller.btnKeypadClicked('5');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
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
                        MbxOtpButton(
                          title: '7',
                          onClicked: () {
                            controller.btnKeypadClicked('7');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          title: '8',
                          onClicked: () {
                            controller.btnKeypadClicked('8');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
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
                        MbxOtpButton(
                          faIcon: FontAwesomeIcons.fingerprint,
                          onClicked: () {
                            controller.btnFingerprintClicked();
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          title: '0',
                          onClicked: () {
                            controller.btnKeypadClicked('0');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
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
