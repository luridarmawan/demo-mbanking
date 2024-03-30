import '../../widgets/all_widgets.dart';

class MbxOtpDot extends StatelessWidget {
  final bool on;

  MbxOtpDot({
    Key? key,
    this.on = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor: on ? ColorX.gray : ColorX.transparent,
      width: 12.0,
      height: 12,
      cornerRadius: 6.0,
      borderWidth: 1.0,
      borderColor: ColorX.gray,
    );
  }
}
