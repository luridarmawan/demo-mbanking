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
                        SizedBox(
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
                        SizedBox(height: 8.0),
                        TextX(
                          MbxProfileVM.profile.name.isEmpty
                              ? '-'
                              : MbxProfileVM.profile.name,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                          color: ColorX.white,
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
                              ContainerX(
                                  padding: EdgeInsets.only(
                                      left: 12.0,
                                      top: 0.0,
                                      right: 12.0,
                                      bottom: 0.0),
                                  child: Material(
                                    color: ColorX.transparent,
                                    child: InkWell(
                                        highlightColor: ColorX.highlight,
                                        customBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: ContainerX(
                                            padding: EdgeInsets.only(
                                                left: 8.0,
                                                top: 8.0,
                                                right: 8.0,
                                                bottom: 8.0),
                                            child: Row(
                                              children: [
                                                ContainerX(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  cornerRadius: 20.0,
                                                  backgroundColor: ColorX.theme
                                                      .withOpacity(0.1),
                                                  child: Center(
                                                    child: ImageX(
                                                      faIcon:
                                                          FontAwesomeIcons.gear,
                                                      width: 20.0,
                                                      height: 20.0,
                                                      color: ColorX.black,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.0,
                                                ),
                                                TextX(
                                                  'Settings',
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorX.black,
                                                ),
                                                Spacer(),
                                                ImageX(
                                                  faIcon: FontAwesomeIcons
                                                      .chevronRight,
                                                  width: 13.0,
                                                  height: 13.0,
                                                  color: ColorX.black,
                                                  fit: BoxFit.contain,
                                                )
                                              ],
                                            ))),
                                  )),
                              ContainerX(
                                  padding: EdgeInsets.only(
                                      left: 12.0,
                                      top: 0.0,
                                      right: 12.0,
                                      bottom: 0.0),
                                  child: Material(
                                    color: ColorX.transparent,
                                    child: InkWell(
                                        highlightColor: ColorX.highlight,
                                        customBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        onTap: () {
                                          controller.btnTncClicked();
                                        },
                                        child: ContainerX(
                                            padding: EdgeInsets.only(
                                                left: 8.0,
                                                top: 8.0,
                                                right: 8.0,
                                                bottom: 8.0),
                                            child: Row(
                                              children: [
                                                ContainerX(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  cornerRadius: 20.0,
                                                  backgroundColor: ColorX.theme
                                                      .withOpacity(0.1),
                                                  child: Center(
                                                    child: ImageX(
                                                      faIcon: FontAwesomeIcons
                                                          .shieldHalved,
                                                      width: 20.0,
                                                      height: 20.0,
                                                      color: ColorX.black,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.0,
                                                ),
                                                TextX(
                                                  'Syarat & Ketentuan',
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorX.black,
                                                ),
                                                Spacer(),
                                                ImageX(
                                                  faIcon: FontAwesomeIcons
                                                      .chevronRight,
                                                  width: 13.0,
                                                  height: 13.0,
                                                  color: ColorX.black,
                                                  fit: BoxFit.contain,
                                                )
                                              ],
                                            ))),
                                  )),
                              ContainerX(
                                  padding: EdgeInsets.only(
                                      left: 12.0,
                                      top: 0.0,
                                      right: 12.0,
                                      bottom: 0.0),
                                  child: Material(
                                    color: ColorX.transparent,
                                    child: InkWell(
                                        highlightColor: ColorX.highlight,
                                        customBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        onTap: () {
                                          controller.btnPrivacyPolicyClicked();
                                        },
                                        child: ContainerX(
                                            padding: EdgeInsets.only(
                                                left: 8.0,
                                                top: 8.0,
                                                right: 8.0,
                                                bottom: 8.0),
                                            child: Row(
                                              children: [
                                                ContainerX(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  cornerRadius: 20.0,
                                                  backgroundColor: ColorX.theme
                                                      .withOpacity(0.1),
                                                  child: Center(
                                                    child: ImageX(
                                                      faIcon: FontAwesomeIcons
                                                          .shieldHalved,
                                                      width: 20.0,
                                                      height: 20.0,
                                                      color: ColorX.black,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.0,
                                                ),
                                                TextX(
                                                  'Kebijakan Privasi',
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorX.black,
                                                ),
                                                Spacer(),
                                                ImageX(
                                                  faIcon: FontAwesomeIcons
                                                      .chevronRight,
                                                  width: 13.0,
                                                  height: 13.0,
                                                  color: ColorX.black,
                                                  fit: BoxFit.contain,
                                                )
                                              ],
                                            ))),
                                  )),
                              ContainerX(
                                  padding: EdgeInsets.only(
                                      left: 12.0,
                                      top: 0.0,
                                      right: 12.0,
                                      bottom: 0.0),
                                  child: Material(
                                    color: ColorX.transparent,
                                    child: InkWell(
                                        highlightColor: ColorX.highlight,
                                        customBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        onTap: () {
                                          controller.btnLogoutClicked();
                                        },
                                        child: ContainerX(
                                            padding: EdgeInsets.only(
                                                left: 8.0,
                                                top: 8.0,
                                                right: 8.0,
                                                bottom: 8.0),
                                            child: Row(
                                              children: [
                                                ContainerX(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  cornerRadius: 20.0,
                                                  backgroundColor: ColorX.theme
                                                      .withOpacity(0.1),
                                                  child: Center(
                                                    child: ImageX(
                                                      faIcon: FontAwesomeIcons
                                                          .powerOff,
                                                      width: 20.0,
                                                      height: 20.0,
                                                      color: ColorX.black,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.0,
                                                ),
                                                TextX(
                                                  'Keluar',
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorX.black,
                                                ),
                                                Spacer(),
                                                ImageX(
                                                  faIcon: FontAwesomeIcons
                                                      .chevronRight,
                                                  width: 13.0,
                                                  height: 13.0,
                                                  color: ColorX.black,
                                                  fit: BoxFit.contain,
                                                )
                                              ],
                                            ))),
                                  )),
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
