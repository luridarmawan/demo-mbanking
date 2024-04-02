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
            bodyView: Material(
                child: Scrollbar(
              controller: controller.scrollController,
              child: SingleChildScrollView(
                  child: Column(children: [
                ContainerX(
                  backgroundColor: ColorX.theme,
                  width: double.infinity,
                  height: 16.0,
                  child: ContainerX(
                      backgroundColor: ColorX.white,
                      topLeftRadius: 16.0,
                      topRightRadius: 16.0),
                ),
                ContainerX(
                  padding: EdgeInsets.all(4.0),
                  borderWidth: 2.0,
                  borderColor: ColorX.green,
                  width: 70.0,
                  height: 70.0,
                  cornerRadius: 35.0,
                  child: Center(
                      child: ImageX(
                    faIcon: FontAwesomeIcons.check,
                    color: ColorX.white,
                    width: 60.0,
                    height: 60.0,
                    cornerRadius: 30.0,
                    backgroundColor: ColorX.green,
                    padding: EdgeInsets.all(12.0),
                  )),
                ),
                ContainerX(height: 16.0),
                /*
                ListView.separated(
                    padding: EdgeInsets.only(
                        bottom:
                            MediaQuery.of(Get.context!).padding.bottom + 100.0),
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
                      final history = controller.historyListVM.list[index];
                      return MbxReceiptCell(history);
                    }), */
              ])),
            ))));
  }
}
