import 'package:carousel_slider/carousel_slider.dart';
import '../../widgets/all_widgets.dart';
import '../demo_image_screen/demo_image_screen.dart';
import 'mbx_home_controller.dart';

class MbxHomeView extends StatelessWidget {
  MbxHomeView({Key? key}) : super(key: key);

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
        bodyView: controller.movieListVM.list.length > 0
            ? CarouselSlider.builder(
                options: CarouselOptions(
                  padEnds: false,
                  autoPlay: true,
                  viewportFraction: 0.80,
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
                              ))));
                })
            : Container(),
      ),
    );
  }
}
