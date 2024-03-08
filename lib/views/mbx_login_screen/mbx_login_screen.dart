import '../../widgets/all_widgets.dart';
import 'mbx_login_controller.dart';

class MbxLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxLoginController>(
        init: MbxLoginController(),
        builder: (controller) => ScreenX(
            lightStatusBar: false,
            topPadding: true,
            bottomPadding: true,
            bodyView: Scrollbar(
                child: SingleChildScrollView(
                    child: Column(
              children: <Widget>[
                SizedBox(height: 24.0),
                ImageX(
                  url: 'lib/images/ic_demo_logo.png',
                  width: 128.0,
                  height: 128.0,
                ),
                SizedBox(
                  height: 4.0,
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'No. Handphone',
                        color: ColorX.gray,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4.0),
                      TextFieldX(
                        hint: 'Masukkan nomor handphone',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        readOnly: false,
                        controller: controller.txtUsernameController,
                        focusNode: controller.txtUsernameNode,
                      ),
                      Visibility(
                          visible: controller.txtUsernameError.isNotEmpty,
                          child: Column(
                            children: [
                              const SizedBox(height: 4.0),
                              TextX(
                                controller.txtUsernameError,
                                color: ColorX.red,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 16.0),
                        ButtonX(
                          title: 'Login',
                          onClicked: () {
                            controller.btnLoginClicked();
                          },
                        )
                      ]),
                )
              ],
            )))));
  }
}
