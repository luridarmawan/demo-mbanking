import 'package:demombanking/utils/all_utils.dart';

import '../../models/mbx_account_model.dart';
import '../../viewmodels/mbx_format_vm.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxAccountCell extends StatelessWidget {
  final MbxAccountModel account;
  MbxAccountCell(this.account);

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      width: 180.0,
      backgroundColor: ColorX.white,
      borderWidth: 1.0,
      borderColor: ColorX.lightGray,
      cornerRadius: 12.0,
      padding: EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ContainerX(
          backgroundColor: ColorX.theme.lighten(0.1),
          padding:
              EdgeInsets.only(left: 8.0, top: 2.0, right: 8.0, bottom: 2.0),
          cornerRadius: 6.0,
          child: TextX(
            account.name,
            color: ColorX.white,
            fontSize: 11.0,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 4.0),
        Row(children: [
          Wrap(
            direction: Axis.vertical,
            children: [
              TextX(
                MbxFormatVM.accountMasking(
                    value: account.account, prefix: '******', visibleDigits: 4),
                color: ColorX.gray,
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
              ),
              TextX(
                MbxFormatVM.currencyIDR(value: account.balance),
                color: ColorX.black,
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ]),
      ]),
    );
  }
}
