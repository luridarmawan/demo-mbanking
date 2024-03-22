import 'package:demombanking/utils/all_utils.dart';

import '../../widgets/all_widgets.dart';
import '../mbx_home_page/mbx_launcher_cell.dart';
import 'mbx_theme_cell.dart';
import 'mbx_theme_sheet_controller.dart';

// ignore: must_be_immutable
class MbxThemeSheet extends GetWidget<MbxThemeSheetController> {
  final String title;
  TextEditingController pinController = TextEditingController();

  MbxThemeSheet({this.title = 'Pilih Theme'});

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showWithGrip(
        backgroundColor: ColorX.white,
        cornerRadius: 32.0,
        avoidingKeyboard: false,
        widget: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxThemeSheetController>(
        init: MbxThemeSheetController(),
        builder: (controller) => ContainerX(
            backgroundColor: ColorX.white,
            topLeftRadius: 32.0,
            topRightRadius: 32.0,
            child: Wrap(children: [
              ContainerX(height: 8.0),
              Container(
                margin: EdgeInsets.only(left: 32.0, right: 32.0),
                child: Row(
                  children: [
                    ButtonX(
                      backgroundColor: ColorX.transparent,
                      faIcon: FontAwesomeIcons.xmark,
                      faWidth: 16.0,
                      faHeight: 16.0,
                      faColor: ColorX.gray,
                      width: 32.0,
                      height: 32.0,
                      cornerRadius: 25.0,
                      borderWidth: 1.0,
                      borderColor: ColorX.gray,
                      onClicked: () {
                        controller.btnCloseClicked();
                      },
                    ),
                    Expanded(
                      child: TextX(
                        title,
                        color: ColorX.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 32.0, height: 32.0),
                  ],
                ),
              ),
              ContainerX(height: 24.0),
              ContainerX(height: 8.0),
              Visibility(
                visible: controller.error.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.only(left: 48.0, right: 48.0),
                  child: TextX(
                    controller.error,
                    color: ColorX.red,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 0.88,
                crossAxisCount: 4,
                padding: EdgeInsets.all(12.0),
                physics: ClampingScrollPhysics(),
                children: [
                  MbxThemeCell(
                    color: Colors.blue,
                  ),
                  MbxThemeCell(color: Colors.red),
                  MbxThemeCell(
                    color: Colors.green,
                  ),
                  MbxThemeCell(
                    color: Colors.orange,
                  ),
                  MbxThemeCell(
                    color: Colors.pink,
                  ),
                  MbxThemeCell(
                    color: Colors.teal,
                  ),
                  MbxThemeCell(
                    color: Colors.purple,
                  ),
                  MbxThemeCell(
                    color: Color(0xff672EBA),
                  ),
                ],
              ),
              ContainerX(height: 24.0),
            ])));
  }
}
