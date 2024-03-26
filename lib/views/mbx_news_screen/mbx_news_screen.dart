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
            headerView: NavigationBarX(
              title: 'BERITA',
              leftBtn: ImageX(
                faIcon: FontAwesomeIcons.arrowLeft,
                width: 20.0,
                height: 20.0,
                color: ColorX.white,
                fit: BoxFit.contain,
              ),
              leftAction: () {
                controller.btnBackClicked();
              },
            ),
            bottomPadding: false,
            bodyView: ContainerX(
                backgroundColor: ColorX.theme,
                child: ContainerX(
                  padding: EdgeInsets.only(top: 12.0),
                  backgroundColor: ColorX.white,
                  topLeftRadius: 12.0,
                  topRightRadius: 12.0,
                  child: controller.newsDetailVM.loading
                      ? Center(
                          child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(ColorX.gray)),
                        )
                      : WebViewWidget(controller: controller.webController),
                ))));
  }
}
