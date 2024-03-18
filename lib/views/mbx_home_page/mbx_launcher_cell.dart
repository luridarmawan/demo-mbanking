import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxLauncherCell extends StatelessWidget {
  final Color color;
  final IconData faIcon;
  final String title;

  MbxLauncherCell(
      {required this.color, required this.faIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorX.transparent,
        child: InkWell(
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            highlightColor: ColorX.white.withOpacity(0.2),
            onTap: () {},
            child: ContainerX(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ImageX(
                            faIcon: faIcon,
                            fit: BoxFit.contain,
                            width: 40.0,
                            height: 40.0,
                            cornerRadius: 28.0,
                            padding: EdgeInsets.all(8.0),
                            backgroundColor: color,
                            color: ColorX.white),
                        SizedBox(
                          height: 4.0,
                        ),
                        TextX(
                          title,
                          color: ColorX.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                        Spacer()
                      ],
                    )))));
  }
}
