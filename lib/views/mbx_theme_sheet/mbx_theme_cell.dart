import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxThemeCell extends StatelessWidget {
  final Color color;

  MbxThemeCell({required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorX.transparent,
        child: InkWell(
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            highlightColor: ColorX.highlight,
            onTap: () {
              final hex = '#${color.value.toRadixString(16)}';
              Get.back(result: hex);
            },
            child: ContainerX(
                child: Center(
              child: ContainerX(
                  width: 50.0,
                  height: 50.0,
                  cornerRadius: 25.0,
                  backgroundColor: color),
            ))));
  }
}
