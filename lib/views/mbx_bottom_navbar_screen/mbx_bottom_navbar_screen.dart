import 'package:demombanking/utils/all_utils.dart';
import 'package:demombanking/views/mbx_notification_page/mbx_notification_page.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_history_page/mbx_history_page.dart';
import '../mbx_home_page/mbx_home_page.dart';
import '../mbx_profile_page/mbx_profile_page.dart';
import 'mbx_bottom_navbar_controller.dart';

// ignore: must_be_immutable
class MbxBottomNavBarScreen extends StatelessWidget {
  final int tabBarIndex;
  MbxBottomNavBarScreen({this.tabBarIndex = 0});
  @override
  Widget build(BuildContext context) {
    final tabWidth = (MediaQuery.of(Get.context!).size.width - 24.0) / 5.0;
    return GetBuilder<MbxBottomNavBarController>(
        init: MbxBottomNavBarController(tabBarIndex: tabBarIndex),
        builder: (controller) => ScreenX(
              bodyView: IndexedStack(
                index: controller.tabBarIndex,
                children: <Widget>[
                  MbxHomePage(),
                  MbxHistoryPage(),
                  ContainerX(backgroundColor: ColorX.white),
                  MbxNotificationPage(),
                  MbxProfilePage(),
                ],
              ),
              floatingActionButton: ButtonX(
                borderWidth: 5.0,
                borderColor: ColorX.theme.lighten(0.45),
                backgroundColor: ColorX.theme,
                width: 70.0,
                height: 70.0,
                cornerRadius: 35.0,
                faIcon: FontAwesomeIcons.qrcode,
                faColor: ColorX.white,
                onClicked: () {
                  controller.btnQRISClicked();
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                height: 60.0,
                elevation: 0.0,
                color: ColorX.theme.lighten(0.45),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ContainerX(
                      backgroundColor: controller.tabBarIndex == 0
                          ? ColorX.theme.lighten(0.35)
                          : ColorX.theme.lighten(0.45),
                      child: InkWellX(
                          highlightColor: ColorX.theme.lighten(0.35),
                          onClicked: () {
                            controller.btnHomeClicked();
                          },
                          child: ContainerX(
                              width: tabWidth,
                              child: Center(
                                child: Wrap(
                                  direction: Axis.vertical,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    ImageX(
                                      faIcon: FontAwesomeIcons.house,
                                      height: 20.0,
                                      width: 20.0,
                                      color: controller.tabBarIndex == 0
                                          ? ColorX.black
                                          : ColorX.gray,
                                    ),
                                    SizedBox(height: 2.0),
                                    TextX(
                                      'Beranda',
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                      color: controller.tabBarIndex == 0
                                          ? ColorX.black
                                          : ColorX.gray,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ))),
                    ),
                    ContainerX(
                        backgroundColor: controller.tabBarIndex == 1
                            ? ColorX.theme.lighten(0.35)
                            : ColorX.theme.lighten(0.45),
                        child: InkWellX(
                            highlightColor: ColorX.theme.lighten(0.35),
                            onClicked: () {
                              controller.btnHistoryClicked();
                            },
                            child: ContainerX(
                                width: tabWidth,
                                child: Center(
                                  child: Wrap(
                                    direction: Axis.vertical,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      ImageX(
                                        faIcon:
                                            FontAwesomeIcons.clockRotateLeft,
                                        height: 20.0,
                                        width: 20.0,
                                        color: controller.tabBarIndex == 1
                                            ? ColorX.black
                                            : ColorX.gray,
                                      ),
                                      SizedBox(height: 2.0),
                                      TextX(
                                        'Riwayat',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500,
                                        color: controller.tabBarIndex == 1
                                            ? ColorX.black
                                            : ColorX.gray,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )))),
                    ContainerX(
                      width: tabWidth,
                    ),
                    ContainerX(
                      backgroundColor: controller.tabBarIndex == 3
                          ? ColorX.theme.lighten(0.35)
                          : ColorX.theme.lighten(0.45),
                      child: InkWellX(
                          highlightColor: ColorX.theme.lighten(0.35),
                          onClicked: () {
                            controller.btnNotificationsClicked();
                          },
                          child: ContainerX(
                              width: tabWidth,
                              child: Center(
                                child: Wrap(
                                  direction: Axis.vertical,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    ImageX(
                                      faIcon: FontAwesomeIcons.bell,
                                      height: 20.0,
                                      width: 20.0,
                                      color: controller.tabBarIndex == 3
                                          ? ColorX.black
                                          : ColorX.gray,
                                    ),
                                    SizedBox(height: 2.0),
                                    TextX(
                                      'Notifikasi',
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                      color: controller.tabBarIndex == 3
                                          ? ColorX.black
                                          : ColorX.gray,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ))),
                    ),
                    ContainerX(
                        backgroundColor: controller.tabBarIndex == 4
                            ? ColorX.theme.lighten(0.35)
                            : ColorX.theme.lighten(0.45),
                        child: InkWellX(
                            highlightColor: ColorX.theme.lighten(0.35),
                            onClicked: () {
                              controller.btnAccountClicked();
                            },
                            child: ContainerX(
                                width: tabWidth,
                                child: Center(
                                  child: Wrap(
                                    direction: Axis.vertical,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      ImageX(
                                        faIcon: FontAwesomeIcons.user,
                                        height: 20.0,
                                        width: 20.0,
                                        color: controller.tabBarIndex == 4
                                            ? ColorX.black
                                            : ColorX.gray,
                                      ),
                                      SizedBox(height: 2.0),
                                      TextX(
                                        'Akun',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500,
                                        color: controller.tabBarIndex == 4
                                            ? ColorX.black
                                            : ColorX.gray,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )))),
                  ],
                ),
              ),
            ));
  }
}
