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
        cornerRadius: 32.0,
        avoidingKeyboard: false,
        widget: this);
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
              ContainerX(height: 8.0),
              Container(
                margin: EdgeInsets.only(left: 32.0, right: 32.0),
                child: Row(
                  children: [
                    ButtonX(
                      backgroundColor: ColorX.transparent,
                      faIcon: FontAwesomeIcons.xmark,
                      faWidth: 16.0,
                      faHeight: 16.0,
                      faColor: ColorX.gray,
                      width: 32.0,
                      height: 32.0,
                      cornerRadius: 25.0,
                      borderWidth: 1.0,
                      borderColor: ColorX.gray,
                      onClicked: () {
                        controller.btnCloseClicked();
                      },
                    ),
                    Expanded(
                      child: TextX(
                        title,
                        color: ColorX.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 32.0, height: 32.0),
                  ],
                ),
              ),
              ContainerX(height: 24.0),
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
                  SizedBox(width: 8.0),
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
                  SizedBox(width: 8.0),
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
                  SizedBox(width: 8.0),
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
                  SizedBox(width: 8.0),
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
                  SizedBox(width: 8.0),
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
              ContainerX(height: 8.0),
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
                child: Column(
                  children: [
                    SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MbxOtpButton(
                          title: '1',
                          onClicked: () {
                            controller.btnKeypadClicked('1');
                          },
                        ),
                        SizedBox(width: 24.0),
                        MbxOtpButton(
                          title: '2',
                          onClicked: () {
                            controller.btnKeypadClicked('2');
                          },
                        ),
                        SizedBox(width: 24.0),
                        MbxOtpButton(
                          title: '3',
                          onClicked: () {
                            controller.btnKeypadClicked('3');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MbxOtpButton(
                          title: '4',
                          onClicked: () {
                            controller.btnKeypadClicked('4');
                          },
                        ),
                        SizedBox(width: 24.0),
                        MbxOtpButton(
                          title: '5',
                          onClicked: () {
                            controller.btnKeypadClicked('5');
                          },
                        ),
                        SizedBox(width: 24.0),
                        MbxOtpButton(
                          title: '6',
                          onClicked: () {
                            controller.btnKeypadClicked('6');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MbxOtpButton(
                          title: '7',
                          onClicked: () {
                            controller.btnKeypadClicked('7');
                          },
                        ),
                        SizedBox(width: 24.0),
                        MbxOtpButton(
                          title: '8',
                          onClicked: () {
                            controller.btnKeypadClicked('8');
                          },
                        ),
                        SizedBox(width: 24.0),
                        MbxOtpButton(
                          title: '9',
                          onClicked: () {
                            controller.btnKeypadClicked('9');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MbxOtpButton(
                          faIcon: FontAwesomeIcons.fingerprint,
                          onClicked: () {
                            controller.btnFingerprintClicked();
                          },
                        ),
                        SizedBox(width: 24.0),
                        MbxOtpButton(
                          title: '0',
                          onClicked: () {
                            controller.btnKeypadClicked('0');
                          },
                        ),
                        SizedBox(width: 24.0),
                        MbxOtpButton(
                          faIcon: FontAwesomeIcons.deleteLeft,
                          onClicked: () {
                            controller.btnBackspaceClicked();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    ButtonX(
                      title: 'Kirim Ulang?',
                      titleColor: ColorX.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      backgroundColor: ColorX.transparent,
                      width: 120.0,
                      height: 32.0,
                      cornerRadius: 16.0,
                      onClicked: () {
                        controller.btnResendClicked();
                      },
                    ),
                    SizedBox(height: 24.0),
                  ],
                ),
              ),
              ContainerX(height: 24.0),
            ])));
  }
}
