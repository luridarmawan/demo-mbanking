import '../../widgets/all_widgets.dart';
import '../mbx_receipt_screen/mbx_receipt_screen.dart';
import 'mbx_notification_controller.dart';
import 'mbx_notification_cell.dart';

class MbxNotificationPage extends StatelessWidget {
  MbxNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxNotificationController>(
        init: MbxNotificationController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'Notifikasi',
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
                      if (controller.notificationListVM.loading == false &&
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
                              itemCount:
                                  controller.notificationListVM.list.length,
                              itemBuilder: (context, index) {
                                if (index ==
                                    controller.notificationListVM.list.length -
                                        1) {
                                  controller.nextPage();
                                }
                                final history =
                                    controller.notificationListVM.list[index];
                                return InkWellX(
                                    highlightColor:
                                        ColorX.theme.withOpacity(0.1),
                                    onClicked: () {
                                      Get.to(MbxReceiptScreen());
                                    },
                                    child: MbxNotificationCell(history));
                              })),
                    )),
              )
            ])));
  }
}
