import 'package:demombanking/utils/all_utils.dart';

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
            highlightColor: ColorX.white.withOpacity(0.2),
            onTap: () {
              final hex = '#${color.value.toRadixString(16)}';
              Get.back(result: hex);
            },
            child: ContainerX(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ContainerX(
                            width: 50.0,
                            height: 50.0,
                            cornerRadius: 25.0,
                            padding: EdgeInsets.all(8.0),
                            backgroundColor: color),
                      ],
                    )))));
  }
}
