import 'package:carousel_slider/carousel_slider.dart';
import 'package:demombanking/utils/all_utils.dart';
import 'package:demombanking/views/mbx_home_page/mbx_account_cell.dart';
import 'package:demombanking/views/mbx_home_page/mbx_news_cell.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';
import 'mbx_home_controller.dart';
import 'mbx_launcher_cell.dart';

class MbxHomePage extends StatelessWidget {
  MbxHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxHomeController>(
        init: MbxHomeController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            bottomPadding: false,
            bodyView: Material(
              color: ColorX.theme,
              child: Scrollbar(
                  child: ListView(
                      padding: EdgeInsets.zero,
                      physics: ClampingScrollPhysics(),
                      children: [
                    ContainerX(
                        width: double.infinity,
                        backgroundColor: ColorX.theme,
                        padding: EdgeInsets.only(
                            left: 24.0, top: 12.0, right: 24.0, bottom: 12.0),
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(Get.context!).padding.top),
                            Row(
                              children: [
                                ContainerX(
                                    backgroundColor: ColorX.white,
                                    width: 46.0,
                                    height: 46.0,
                                    cornerRadius: 23.0,
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
                                          ? 20.0
                                          : 40.0,
                                      height: 40.0,
                                      cornerRadius: 20.0,
                                    ))),
                                SizedBox(width: 8.0),
                                TextX(
                                  MbxProfileVM.profile.name.isEmpty
                                      ? '-'
                                      : MbxProfileVM.profile.name,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w700,
                                  color: ColorX.white,
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Material(
                                        color: ColorX.transparent,
                                        child: InkWell(
                                          customBorder: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                          highlightColor: ColorX.highlight,
                                          onTap: () {
                                            controller.btnThemeClicked();
                                          },
                                          child: ContainerX(
                                            width: 42.0,
                                            height: 42.0,
                                            cornerRadius: 12.0,
                                            child: Center(
                                                child: ContainerX(
                                              backgroundColor: ColorX.theme,
                                              width: 32.0,
                                              height: 32.0,
                                              cornerRadius: 16.0,
                                              borderWidth: 4.0,
                                              borderColor: ColorX.white,
                                            )),
                                          ),
                                        )),
                                    ButtonX(
                                      backgroundColor: ColorX.transparent,
                                      faIcon: FontAwesomeIcons.powerOff,
                                      faColor: ColorX.white,
                                      width: 42.0,
                                      height: 42.0,
                                      onClicked: () {},
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )),
                    ContainerX(
                        backgroundColor: ColorX.white,
                        topLeftRadius: 16.0,
                        topRightRadius: 16.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 12.0,
                                  top: 12.0,
                                  right: 12.0,
                                  bottom: 4.0),
                              child: TextX(
                                'REKENING',
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,
                                color: ColorX.black,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                                height: 78.0,
                                child: ListView.separated(
                                    padding: EdgeInsets.only(
                                        left: 12.0, right: 12.0),
                                    physics: ClampingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) {
                                      return ContainerX(width: 8.0);
                                    },
                                    itemCount:
                                        MbxProfileVM.profile.accounts.length,
                                    itemBuilder: (context, index) {
                                      return InkWellX(
                                          cornerRadius: 12.0,
                                          child: MbxAccountCell(
                                            account: MbxProfileVM
                                                .profile.accounts[index],
                                            onClicked: () {
                                              controller.btnEyeClicked(index);
                                            },
                                          ));
                                    })),
                            SizedBox(height: 12.0),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 12.0, top: 4.0, right: 12.0),
                              child: ContainerX(
                                backgroundColor: ColorX.theme,
                                cornerRadius: 12.0,
                                child: GridView.count(
                                  shrinkWrap: true,
                                  mainAxisSpacing: 0.0,
                                  crossAxisSpacing: 0.0,
                                  childAspectRatio: 0.88,
                                  crossAxisCount: 4,
                                  padding: EdgeInsets.all(12.0),
                                  physics: ClampingScrollPhysics(),
                                  children: [
                                    MbxLauncherCell(
                                        color: ColorX.green,
                                        faIcon: FontAwesomeIcons
                                            .arrowRightArrowLeft,
                                        title: 'Transfer'),
                                    MbxLauncherCell(
                                        color: ColorX.blue,
                                        faIcon: FontAwesomeIcons.sackDollar,
                                        title: 'Tarik Tunai'),
                                    MbxLauncherCell(
                                        color: ColorX.teal,
                                        faIcon: FontAwesomeIcons.landmark,
                                        title: 'Deposito'),
                                    MbxLauncherCell(
                                        color: ColorX.yellow,
                                        faIcon:
                                            FontAwesomeIcons.handHoldingDollar,
                                        title: 'Paylater'),
                                    MbxLauncherCell(
                                        color: ColorX.red,
                                        faIcon: FontAwesomeIcons.qrcode,
                                        title: 'QRIS'),
                                    MbxLauncherCell(
                                        color: ColorX.green,
                                        faIcon: FontAwesomeIcons.houseFlag,
                                        title: 'Bayar'),
                                    MbxLauncherCell(
                                        color: ColorX.blue,
                                        faIcon:
                                            FontAwesomeIcons.circleDollarToSlot,
                                        title: 'Top Up'),
                                    MbxLauncherCell(
                                        color: ColorX.gray,
                                        faIcon: FontAwesomeIcons.ellipsis,
                                        title: 'Lainnya'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 12.0,
                                  top: 8.0,
                                  right: 12.0,
                                  bottom: 4.0),
                              child: TextX(
                                'FAVORIT',
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,
                                color: ColorX.black,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0, right: 12.0),
                              child: ContainerX(
                                backgroundColor: ColorX.theme.darken(0.03),
                                cornerRadius: 12.0,
                                child: GridView.count(
                                  shrinkWrap: true,
                                  mainAxisSpacing: 0.0,
                                  crossAxisSpacing: 0.0,
                                  childAspectRatio: 0.88,
                                  crossAxisCount: 4,
                                  padding: EdgeInsets.all(12.0),
                                  physics: ClampingScrollPhysics(),
                                  children: [
                                    MbxLauncherCell(
                                        color: ColorX.yellow,
                                        faIcon: FontAwesomeIcons.solidLightbulb,
                                        title: 'Listrik PLN'),
                                    MbxLauncherCell(
                                        color: ColorX.red,
                                        faIcon: FontAwesomeIcons.mobile,
                                        title: 'Pulsa'),
                                    MbxLauncherCell(
                                        color: ColorX.blue,
                                        faIcon: FontAwesomeIcons.water,
                                        title: 'PAM'),
                                    MbxLauncherCell(
                                        color: ColorX.teal,
                                        faIcon: FontAwesomeIcons.shield,
                                        title: 'BPJS'),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 12.0,
                                  top: 8.0,
                                  right: 12.0,
                                  bottom: 4.0),
                              child: TextX(
                                'BERITA',
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,
                                color: ColorX.black,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            controller.newsListVM.list.length > 0
                                ? CarouselSlider.builder(
                                    options: CarouselOptions(
                                      padEnds: false,
                                      autoPlay: true,
                                      viewportFraction: 0.70,
                                      height: 150.0,
                                      onPageChanged: (index, reason) {
                                        controller.setPageIndex(index);
                                      },
                                    ),
                                    itemCount:
                                        controller.newsListVM.list.length,
                                    itemBuilder: (BuildContext context,
                                        int index, int pageViewIndex) {
                                      return MbxNewsCell(
                                          controller.newsListVM.list[index]);
                                    })
                                : Container(),
                            SizedBox(height: 8.0),
                            SizedBox(
                              height: 140.0,
                            )
                          ],
                        ))
                  ])),
            )));
  }
}
