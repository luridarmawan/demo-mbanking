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
                  child: Scrollbar(
                child: SingleChildScrollView(
                    child: Column(children: [
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
                  TextX(
                    controller.receiptVM.title,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                  TextX(controller.receiptVM.amount,
                      fontSize: 24.0, fontWeight: FontWeight.w600),
                  ContainerX(height: 16.0),
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: ClampingScrollPhysics(),
                      itemCount: controller.receiptVM.details.length,
                      itemBuilder: (context, index) {
                        final detail = controller.receiptVM.details[index];
                        return MbxReceiptCell(detail);
                      }),
                ])),
              ))
            ])));
  }
}

class DashedDivider extends StatelessWidget {
  final double dashWidth;
  final double dashHeight;
  final Color dashColor;

  DashedDivider({
    this.dashWidth = 10.0,
    this.dashHeight = 1.0,
    this.dashColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: dashColor),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
