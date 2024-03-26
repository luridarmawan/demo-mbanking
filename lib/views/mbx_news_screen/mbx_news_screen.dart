import '../../models/mbx_news_model.dart';
import '../../widgets/all_widgets.dart';
import 'mbx_news_controller.dart';

class MbxNewsScreen extends StatelessWidget {
  final MbxNewsModel news;

  MbxNewsScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxNewsController>(
        init: MbxNewsController(),
        builder: (controller) => ScreenX(
              lightStatusBar: true,
              bottomPadding: false,
              bodyView: ContainerX(
                  backgroundColor: ColorX.white,
                  child: controller.newsDetailVM.loading
                      ? Center(
                          child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(ColorX.gray)),
                        )
                      : Column(children: [
                          ImageX(
                            url: news.image,
                            width: MediaQuery.of(Get.context!).size.width,
                            height: MediaQuery.of(Get.context!).size.width *
                                MbxNewsModel.imageAspectRatio,
                          ),
                          Expanded(
                              child: WebViewWidget(
                                  controller: controller.webController))
                        ])),
            ));
  }
}
