import 'package:demombanking/views/mbx_profile_page/mbx_profile_menu_button.dart';

import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';
import 'mbx_profile_controller.dart';

class MbxProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxProfileController>(
        init: MbxProfileController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            topPadding: false,
            bottomPadding: true,
            bodyView: Column(
              children: [
                ContainerX(
                    width: double.infinity,
                    backgroundColor: ColorX.theme,
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        ContainerX(
                            height: MediaQuery.of(Get.context!).padding.top),
                        ContainerX(
                            backgroundColor: ColorX.white,
                            width: 110.0,
                            height: 110.0,
                            cornerRadius: 55.0,
                            child: Center(
                                child: ImageX(
                              faIcon: MbxProfileVM.profile.photo.isEmpty
                                  ? FontAwesomeIcons.user
                                  : null,
                              color: MbxProfileVM.profile.photo.isEmpty
                                  ? ColorX.gray
                                  : null,
                              url: MbxProfileVM.profile.photo,
                              width: MbxProfileVM.profile.photo.isEmpty
                                  ? 50.0
                                  : 100.0,
                              height: 100.0,
                              cornerRadius: 50.0,
                            ))),
                        ContainerX(height: 8.0),
                        TextX(
                          MbxProfileVM.profile.name.isEmpty
                              ? '-'
                              : MbxProfileVM.profile.name,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                          color: ColorX.white,
                        ),
                        ContainerX(
                          height: 2.0,
                        ),
                        TextX(
                          MbxProfileVM.profile.email.isEmpty
                              ? '-'
                              : MbxProfileVM.profile.email,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: ColorX.white,
                        ),
                      ],
                    )),
                Expanded(
                    child: ContainerX(
                        backgroundColor: ColorX.theme,
                        child: ContainerX(
                            padding: EdgeInsets.only(top: 16.0),
                            backgroundColor: ColorX.white,
                            topLeftRadius: 16.0,
                            topRightRadius: 16.0,
                            child: Column(children: [
                              MbaxProfileMenuButton(
                                title: 'Aktivasi Biometrik',
                                faIcon: FontAwesomeIcons.fingerprint,
                                onClicked: () {},
                              ),
                              MbaxProfileMenuButton(
                                title: 'Ganti PIN',
                                faIcon: FontAwesomeIcons.key,
                                onClicked: () {},
                              ),
                              MbaxProfileMenuButton(
                                title: 'Syarat & Ketentuan',
                                faIcon: FontAwesomeIcons.shieldHalved,
                                onClicked: () {
                                  controller.btnTncClicked();
                                },
                              ),
                              MbaxProfileMenuButton(
                                title: 'Kebijakan Privasi',
                                faIcon: FontAwesomeIcons.shieldHalved,
                                onClicked: () {
                                  controller.btnPrivacyPolicyClicked();
                                },
                              ),
                              MbaxProfileMenuButton(
                                title: 'Keluar',
                                faIcon: FontAwesomeIcons.powerOff,
                                onClicked: () {
                                  controller.btnLogoutClicked();
                                },
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(24.0),
                                child: TextX(
                                  controller.version,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorX.black,
                                ),
                              ),
                            ]))))
              ],
            )));
  }
}
