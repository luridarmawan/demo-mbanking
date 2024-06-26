import 'all_widgets.dart';

class SheetX {
  static Future<T?> showMessage<T>(
      {Widget? icon,
      required String title,
      required String message,
      bool centered = true,
      required String leftBtnTitle,
      required VoidCallback onLeftBtnClicked,
      String rightBtnTitle = '',
      VoidCallback? onRightBtnClicked,
      bool autoClose = true}) {
    return SheetX.showContent(
        backgroundColor: ColorX.white,
        cornerRadius: 16.0,
        contentMaxHeight: MediaQuery.of(Get.context!).size.height * 0.70,
        contentWidget: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              Visibility(
                visible: icon != null,
                child: Column(children: [
                  icon ?? Container(),
                  const SizedBox(height: 12.0),
                ]),
              ),
              const SizedBox(height: 8.0),
              TextX(
                message,
                color: ColorX.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
                textAlign: centered ? TextAlign.center : TextAlign.start,
                maxLines: 2048,
              ),
            ],
          ),
        ),
        footerWidget: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Visibility(
                visible: leftBtnTitle.isNotEmpty,
                child: Expanded(
                  child: ButtonX(
                    title: leftBtnTitle,
                    titleColor: ColorX.white,
                    borderWidth: 1.0,
                    borderColor: ColorX.theme,
                    backgroundColor: ColorX.theme,
                    onClicked: onLeftBtnClicked,
                  ),
                ),
              ),
              Visibility(
                  visible: leftBtnTitle.isNotEmpty && rightBtnTitle.isNotEmpty,
                  child: const SizedBox(width: 8.0)),
              Visibility(
                visible: rightBtnTitle.isNotEmpty,
                child: Expanded(
                  child: ButtonX(
                    title: rightBtnTitle,
                    titleColor: ColorX.black,
                    backgroundColor: ColorX.white,
                    highlightColor: ColorX.theme.withOpacity(0.1),
                    borderWidth: 1.0,
                    borderColor: ColorX.gray,
                    onClicked: onRightBtnClicked ?? () => {},
                  ),
                ),
              )
            ],
          ),
        ),
        autoClose: autoClose,
        title: title);
  }

  static Future<T?> show<T>(
      {required Color backgroundColor,
      required double cornerRadius,
      required Widget widget,
      bool autoClose = true}) {
    FocusManager.instance.primaryFocus?.unfocus();
    return Get.bottomSheet(
        isDismissible: autoClose,
        isScrollControlled: true,
        ignoreSafeArea: false,
        backgroundColor: ColorX.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cornerRadius),
              topRight: Radius.circular(cornerRadius)),
        ),
        widget);
  }

  static Future<T?> showWithGrip<T>(
      {required Color backgroundColor,
      required double cornerRadius,
      required Widget widget,
      String title = '',
      bool autoClose = true}) {
    return SheetX.show(
        backgroundColor: backgroundColor,
        cornerRadius: cornerRadius,
        widget: Wrap(children: [
          ContainerX(
              backgroundColor: ColorX.theme,
              width: double.infinity,
              topLeftRadius: 16.0,
              topRightRadius: 16.0,
              child: Wrap(
                children: [
                  ContainerX(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
                    child: Row(
                      children: [
                        ButtonX(
                          backgroundColor: ColorX.transparent,
                          faIcon: FontAwesomeIcons.xmark,
                          faWidth: 16.0,
                          faHeight: 16.0,
                          faColor: ColorX.white,
                          width: 28.0,
                          height: 28.0,
                          cornerRadius: 14.0,
                          borderWidth: 1.0,
                          borderColor: ColorX.white,
                          onClicked: () {
                            Get.back();
                          },
                        ),
                        ContainerX(width: 8.0),
                        Expanded(
                          child: TextX(
                            title,
                            color: ColorX.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ContainerX(width: 8.0),
                        SizedBox(width: 28.0, height: 28.0),
                      ],
                    ),
                  ),
                  ContainerX(
                    backgroundColor: ColorX.theme,
                    width: double.infinity,
                    height: 16.0,
                    child: ContainerX(
                        backgroundColor: ColorX.white,
                        topLeftRadius: 16.0,
                        topRightRadius: 16.0),
                  ),
                ],
              )),
          widget
        ]),
        autoClose: autoClose);
  }

  static Future<T?> showContent<T>(
      {required Color backgroundColor,
      required double cornerRadius,
      required double contentMaxHeight,
      required Widget contentWidget,
      required Widget footerWidget,
      bool autoClose = true,
      String title = ''}) {
    return SheetX.showWithGrip(
        backgroundColor: ColorX.white,
        cornerRadius: cornerRadius,
        widget: Column(children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: contentMaxHeight,
            ),
            child: Scrollbar(
                child: SingleChildScrollView(
              child: contentWidget,
            )),
          ),
          footerWidget,
          SizedBox(height: MediaQuery.of(Get.context!).padding.bottom)
        ]),
        title: title,
        autoClose: autoClose);
  }
}
