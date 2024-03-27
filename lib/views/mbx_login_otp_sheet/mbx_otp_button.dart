import 'package:demombanking/utils/all_utils.dart';
import '../../widgets/all_widgets.dart';

class MbxOtpButton extends StatelessWidget {
  final String title;
  final IconData? faIcon;

  final GestureTapCallback? onClicked;

  MbxOtpButton({
    Key? key,
    this.title = '',
    this.faIcon = null,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonX(
        width: 64.0,
        height: 64.0,
        cornerRadius: 32.0,
        borderWidth: 1.0,
        borderColor: ColorX.theme,
        backgroundColor: ColorX.theme.lighten(0.4),
        titleColor: ColorX.black,
        title: title,
        faIcon: faIcon,
        faColor: ColorX.black,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        onClicked: onClicked);
  }
}
