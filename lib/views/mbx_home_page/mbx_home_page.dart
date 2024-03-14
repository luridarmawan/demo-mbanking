import 'package:carousel_slider/carousel_slider.dart';
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
          headerView: NavigationBarX(
            title: 'Beranda',
          ),
          bottomPadding: false,
          bodyView: ListView(children: [
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  left: 8.0,
                  top: 8.0,
                  right: 8.0,
                  bottom: 8.0 + MediaQuery.of(Get.context!).padding.bottom),
              physics: ClampingScrollPhysics(),
              itemCount: controller.movieListVM.list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.65,
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                final movie = controller.movieListVM.list[index];
                return Material(
                    color: ColorX.transparent,
                    child: InkWell(
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        highlightColor: ColorX.highlight,
                        onTap: () {
                          Get.to(DemoImageScreen(url: movie.poster));
                        },
                        child: MbxHomeGridCell(movie)));
              },
            ),
            SizedBox(height: 8.0),
            controller.movieListVM.list.length > 0
                ? CarouselSlider.builder(
                    options: CarouselOptions(
                      padEnds: false,
                      autoPlay: true,
                      viewportFraction: 0.85,
                      height: 180.0,
                      onPageChanged: (index, reason) {
                        controller.setPageIndex(index);
                      },
                    ),
                    itemCount: controller.movieListVM.list.length,
                    itemBuilder:
                        (BuildContext context, int index, int pageViewIndex) {
                      final movie = controller.movieListVM.list[index];
                      return Material(
                          color: ColorX.transparent,
                          child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
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
                                    cornerRadius: 8.0,
                                    fit: BoxFit.cover,
                                  )))); //)));
                    })
                : Container(),
            SizedBox(height: 8.0),
          ])),
    );
  }
}
