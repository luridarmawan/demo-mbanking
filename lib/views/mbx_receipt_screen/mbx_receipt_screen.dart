import '../../widgets/all_widgets.dart';
import 'mbx_receipt_controller.dart';
import 'mbx_receipt_cell.dart';

class MbxReceiptScreen extends StatelessWidget {
  MbxReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxReceiptController>(
        init: MbxReceiptController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'Receipt',
            ),
            bottomPadding: false,
            bodyView: Column(children: [
              ContainerX(
                backgroundColor: ColorX.theme,
                width: double.infinity,
                height: 16.0,
                child: ContainerX(
                    backgroundColor: ColorX.white,
                    topLeftRadius: 16.0,
                    topRightRadius: 16.0),
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (controller.historyListVM.loading == false &&
                          scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                        controller.nextPage();
                      }
                      return true;
                    },
                    child: Material(
                      child: Scrollbar(
                          controller: controller.scrollController,
                          child: ListView.separated(
                              controller: controller.scrollController,
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(Get.context!)
                                          .padding
                                          .bottom +
                                      100.0),
                              physics: ClampingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return Padding(
                                    padding: EdgeInsets.only(left: 60.0),
                                    child: ContainerX(
                                      height: 1.0,
                                      width: double.infinity,
                                      backgroundColor: ColorX.lightGray,
                                    ));
                              },
                              itemCount: controller.historyListVM.list.length,
                              itemBuilder: (context, index) {
                                final history =
                                    controller.historyListVM.list[index];
                                return InkWellX(
                                    highlightColor:
                                        ColorX.theme.withOpacity(0.1),
                                    onClicked: () {},
                                    child: MbxReceiptCell(history));
                              })),
                    )),
              )
            ])));
  }
}
