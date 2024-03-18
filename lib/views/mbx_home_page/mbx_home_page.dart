import 'package:carousel_slider/carousel_slider.dart';
import 'package:demombanking/views/mbx_home_page/mbx_banner_cell.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';
import '../demo_image_screen/demo_image_screen.dart';
import 'mbx_home_controller.dart';
import 'mbx_home_grid_cell.dart';

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
              child: Scrollbar(
                  child: ListView(padding: EdgeInsets.zero, children: [
                ContainerX(
                    width: double.infinity,
                    backgroundColor: ColorX.theme,
                    padding: EdgeInsets.only(
                        left: 24.0, top: 12.0, right: 24.0, bottom: 12.0),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(Get.context!).padding.top),
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
                          ],
                        )
                      ],
                    )),
                SizedBox(
                    height: 100.0,
                    child: ListView.separated(
                        padding: EdgeInsets.all(8.0),
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return ContainerX(width: 8.0);
                        },
                        itemCount: MbxProfileVM.profile.accounts.length,
                        itemBuilder: (context, index) {
                          return Material(
                              color: ColorX.transparent,
                              child: InkWell(
                                  highlightColor: ColorX.highlight,
                                  onTap: () {
                                    //Get.to(DemoImageScreen(url: movie.poster));
                                  },
                                  child: MbxBannerCell(
                                      MbxProfileVM.profile.accounts[index])));
                        })),
                GridView.count(
                  shrinkWrap: true,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 0.85,
                  crossAxisCount: 4,
                  padding: EdgeInsets.all(8.0),
                  physics: ClampingScrollPhysics(),
                  children: [
                    MbxHomeGridCell(
                        color: ColorX.green,
                        faIcon: FontAwesomeIcons.arrowRightArrowLeft,
                        title: 'Transfer'),
                    MbxHomeGridCell(
                        color: ColorX.blue,
                        faIcon: FontAwesomeIcons.sackDollar,
                        title: 'Tarik Tunai'),
                    MbxHomeGridCell(
                        color: ColorX.teal,
                        faIcon: FontAwesomeIcons.landmark,
                        title: 'Deposito'),
                    MbxHomeGridCell(
                        color: ColorX.yellow,
                        faIcon: FontAwesomeIcons.handHoldingDollar,
                        title: 'Paylater'),
                    MbxHomeGridCell(
                        color: ColorX.red,
                        faIcon: FontAwesomeIcons.qrcode,
                        title: 'QRIS'),
                    MbxHomeGridCell(
                        color: ColorX.green,
                        faIcon: FontAwesomeIcons.houseFlag,
                        title: 'Bayar'),
                    MbxHomeGridCell(
                        color: ColorX.blue,
                        faIcon: FontAwesomeIcons.circleDollarToSlot,
                        title: 'Top Up'),
                    MbxHomeGridCell(
                        color: ColorX.gray,
                        faIcon: FontAwesomeIcons.ellipsis,
                        title: 'Lainnya'),
                  ],
                ),
                controller.movieListVM.list.length > 0
                    ? CarouselSlider.builder(
                        options: CarouselOptions(
                          padEnds: false,
                          autoPlay: true,
                          viewportFraction: 0.75,
                          height: 120.0,
                          onPageChanged: (index, reason) {
                            controller.setPageIndex(index);
                          },
                        ),
                        itemCount: controller.movieListVM.list.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          final movie = controller.movieListVM.list[index];
                          return Material(
                              color: ColorX.transparent,
                              child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  highlightColor: ColorX.highlight,
                                  onTap: () {
                                    Get.to(DemoImageScreen(url: movie.poster));
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: ImageX(
                                        url: movie.poster,
                                        width: double.infinity,
                                        height: double.infinity,
                                        cornerRadius: 12.0,
                                        fit: BoxFit.cover,
                                      )))); //)));
                        })
                    : Container(),
                SizedBox(height: 8.0),
              ])),
            )));
  }
}
