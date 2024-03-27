import '../../widgets/all_widgets.dart';
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
            loading: controller.notificationListVM.list.isEmpty &&
                controller.notificationListVM.loading,
            headerView: NavigationBarX(
              title: 'Notifikasi',
            ),
            bottomPadding: false,
            bodyView: ContainerX(
                backgroundColor: ColorX.theme,
                child: ContainerX(
                  padding: EdgeInsets.only(top: 16.0),
                  backgroundColor: ColorX.white,
                  topLeftRadius: 16.0,
                  topRightRadius: 16.0,
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
                            child: ListView.separated(
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
                                  final history =
                                      controller.notificationListVM.list[index];
                                  return InkWellX(
                                      onClicked: () {},
                                      child: MbxNotificationCell(history));
                                })),
                      )),
                ))));
  }
}
