import '../../models/mbx_account_model.dart';
import '../../viewmodels/mbx_format_vm.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxAccountCell extends StatelessWidget {
  final MbxAccountModel account;
  MbxAccountCell(this.account);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.35,
      child: ContainerX(
        backgroundColor: ColorX.white,
        borderWidth: 1.0,
        borderColor: ColorX.gray,
        cornerRadius: 12.0,
        padding: EdgeInsets.all(12.0),
        child: Row(children: [
          Wrap(
            direction: Axis.vertical,
            children: [
              TextX(
                account.name,
                color: ColorX.gray,
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              TextX(
                MbxFormatVM.accountMasking(
                    value: account.account, prefix: '******', visibleDigits: 3),
                color: ColorX.gray,
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
              ),
              TextX(
                MbxFormatVM.currencyIDR(value: account.balance),
                color: ColorX.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
