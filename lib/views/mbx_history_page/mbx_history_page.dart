import '../../widgets/all_widgets.dart';
import 'mbx_history_controller.dart';
import 'mbx_history_cell.dart';

class MbxHistoryPage extends StatelessWidget {
  MbxHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxHistoryController>(
        init: MbxHistoryController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            loading: controller.historyListVM.list.isEmpty &&
                controller.historyListVM.loading,
            headerView: NavigationBarX(
              title: 'Riwayat',
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
                        if (controller.historyListVM.loading == false &&
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
                                itemCount: controller.historyListVM.list.length,
                                itemBuilder: (context, index) {
                                  final history =
                                      controller.historyListVM.list[index];
                                  return Material(
                                      color: ColorX.transparent,
                                      child: InkWell(
                                          highlightColor: ColorX.highlight,
                                          onTap: () {},
                                          child: MbxHistoryCell(history)));
                                })),
                      )),
                ))));
  }
}
