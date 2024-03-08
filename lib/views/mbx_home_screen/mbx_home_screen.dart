import 'package:demombanking/views/demo_listview_screen/demo_listview_screen.dart';
import 'package:demombanking/views/mbx_history_view/mbx_history_view.dart';

import '../../widgets/all_widgets.dart';
import 'mbx_home_controller.dart';

// ignore: must_be_immutable
class MbxHomeScreen extends StatelessWidget {
  final int tabBarIndex;
  MbxHomeScreen({this.tabBarIndex = 0});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxHomeController>(
        init: MbxHomeController(tabBarIndex: tabBarIndex),
        builder: (controller) => ScreenX(
              bodyView: IndexedStack(
                index: controller.tabBarIndex,
                children: <Widget>[
                  ContainerX(backgroundColor: ColorX.blue),
                  ContainerX(backgroundColor: ColorX.teal),
                  MbxHistoryView(),
                  ContainerX(backgroundColor: ColorX.green),
                  ContainerX(backgroundColor: ColorX.red),
                ],
              ),
              bottomNavigationBar: Theme(
                data: ThemeData(
                  splashColor: ColorX.transparent,
                  highlightColor: ColorX.transparent,
                  hoverColor: ColorX.transparent,
                ),
                child: BottomNavigationBar(
                    backgroundColor: ColorX.white,
                    currentIndex: controller.tabBarIndex,
                    onTap: (index) {
                      controller.onChange(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0.0,
                    items: [
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.house,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Beranda',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          icon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.house,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray.withOpacity(0.60),
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Beranda',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray.withOpacity(0.60),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.qrcode,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'QRIS',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          icon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.qrcode,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray.withOpacity(0.60),
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'QRIS',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray.withOpacity(0.60),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.clockRotateLeft,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Riwayat',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          icon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.clockRotateLeft,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray.withOpacity(0.60),
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Riwayat',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray.withOpacity(0.60),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.user,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Akun Saya',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          icon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.user,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray.withOpacity(0.60),
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Akun Saya',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray.withOpacity(0.60),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          label: ''),
                    ]),
              ),
            ));
  }
}