import 'package:demombanking/models/mbx_receipt_detail_model.dart';
import '../../widgets/all_widgets.dart';
import 'mbx_receipt_screen.dart';

// ignore: must_be_immutable
class MbxReceiptCell extends StatelessWidget {
  final MbxReceiptDetailModel detail;
  MbxReceiptCell(this.detail);

  @override
  Widget build(BuildContext context) {
    return detail.label == '-'
        ? Padding(
            padding:
                EdgeInsets.only(left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
            child: DashedDivider(
                dashColor: ColorX.gray, dashWidth: 6.0, dashHeight: 1.0))
        : Padding(
            padding:
                EdgeInsets.only(left: 24.0, top: 4.0, right: 24.0, bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextX(
                          detail.label,
                          color: ColorX.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                        ),
                      ),
                      ContainerX(width: 24.0),
                      Expanded(
                          child: TextX(
                        detail.value,
                        color: ColorX.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.end,
                        maxLines: 1,
                      )),
                    ],
                  ),
                ),
              ],
            ));
  }
}
