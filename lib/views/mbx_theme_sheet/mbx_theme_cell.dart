import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxThemeCell extends StatelessWidget {
  final Color color;

  MbxThemeCell({required this.color});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        child: Center(
            child: Material(
                color: ColorX.transparent,
                child: InkWellX(
                    cornerRadius: 29.0,
                    highlightColor: ColorX.highlight,
                    onClicked: () {
                      final hex = '#${color.value.toRadixString(16)}';
                      Get.back(result: hex);
                    },
                    child: ContainerX(
                      padding: EdgeInsets.all(4.0),
                      cornerRadius: 29.0,
                      borderWidth:
                          color.value == ColorX.theme.value ? 2.0 : 0.0,
                      borderColor: color.value == ColorX.theme.value
                          ? ColorX.black
                          : ColorX.transparent,
                      child: ContainerX(
                          width: 50.0,
                          height: 50.0,
                          cornerRadius: 25.0,
                          backgroundColor: color),
                    )))));
  }
}
