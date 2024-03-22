import 'package:demombanking/utils/all_utils.dart';
import '../../models/mbx_account_model.dart';
import '../../viewmodels/mbx_format_vm.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxAccountCell extends StatelessWidget {
  final MbxAccountModel account;
  final GestureTapCallback? onClicked;

  MbxAccountCell({required this.account, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      width: 180.0,
      backgroundColor: ColorX.white,
      borderWidth: 1.0,
      borderColor: ColorX.lightGray,
      cornerRadius: 12.0,
      padding: EdgeInsets.only(left: 8.0, top: 0.0, right: 8.0, bottom: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Column(
            children: [
              SizedBox(height: 8.0),
              ContainerX(
                backgroundColor: ColorX.theme.lighten(0.1),
                padding: EdgeInsets.only(
                    left: 8.0, top: 2.0, right: 8.0, bottom: 2.0),
                cornerRadius: 6.0,
                child: TextX(
                  account.name,
                  color: ColorX.white,
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          Expanded(
            child: Material(
                color: ColorX.transparent,
                child: InkWell(
                    highlightColor: ColorX.transparent,
                    onTap: () {
                      onClicked!();
                    },
                    child: Column(children: [
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          ImageX(
                            faIcon: account.visible
                                ? FontAwesomeIcons.eyeSlash
                                : FontAwesomeIcons.eye,
                            width: 32.0,
                            height: 20.0,
                          ),
                          Spacer()
                        ],
                      )
                    ]))),
          )

          /*
          ButtonX(
            faIcon: account.visible
                ? FontAwesomeIcons.eyeSlash
                : FontAwesomeIcons.eye,
            faColor: ColorX.black,
            faWidth: 32.0,
            faHeight: 16.0,
            backgroundColor: ColorX.yellow,
            width: 32.0,
            height: 32.0,
            onClicked: onClicked,
          ) */
        ]),
        Row(children: [
          Wrap(
            direction: Axis.vertical,
            children: [
              TextX(
                account.visible
                    ? account.account
                    : MbxFormatVM.accountMasking(
                        value: account.account,
                        prefix: '******',
                        visibleDigits: 4),
                color: ColorX.gray,
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
              ),
              TextX(
                MbxFormatVM.currencyIDR(
                    value: account.balance, masked: !account.visible),
                color: ColorX.black,
                fontSize: 13.0,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ]),
      ]),
    );
  }
}
