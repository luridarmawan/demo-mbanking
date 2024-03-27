import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/all_widgets.dart';
import 'mbx_login_controller.dart';

class MbxLoginScreen extends StatelessWidget {
  MbxLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbLoginController>(
        init: MbLoginController(),
        builder: (controller) => ScreenX(
            lightStatusBar: false,
            topPadding: false,
            bottomPadding: true,
            bodyView: Column(
              children: [
                Expanded(
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: controller.pageController,
                    children: controller.onboardingVM.list
                        .map((onboarding) => Column(
                              children: [
                                Expanded(
                                  child: Stack(children: [
                                    ImageX(
                                      url: onboarding.image,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ]),
                                ),
                                ContainerX(
                                  width: double.infinity,
                                  height: 160.0,
                                  padding: const EdgeInsets.only(
                                      left: 24.0,
                                      top: 16.0,
                                      right: 24.0,
                                      bottom: 16.0),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextX(
                                        onboarding.title,
                                        color: ColorX.black,
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 8.0),
                                      TextX(
                                        onboarding.description,
                                        color: ColorX.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.center,
                                        maxLines: 4,
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 4.0, right: 24.0, bottom: 4.0),
                  height: 20.0,
                  child: Visibility(
                      visible: controller.onboardingVM.list.length > 0,
                      child: SmoothPageIndicator(
                        controller: controller.pageController,
                        count: controller.onboardingVM.list.length,
                        effect: SlideEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: ColorX.theme.withOpacity(0.2),
                          activeDotColor: ColorX.theme,
                        ),
                      )),
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 16.0, right: 24.0, bottom: 16.0),
                  child: TextFieldX(
                    hint: 'No. HP (08xxxxxxxxx)',
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    readOnly: false,
                    controller: controller.txtPhoneController,
                    focusNode: controller.txtPhoneNode,
                    onChanged: (value) {
                      controller.txtPhoneOnChanged(value);
                    },
                    rightIcon: ImageX(
                      faIcon: FontAwesomeIcons.arrowRight,
                      color: ColorX.white,
                      width: 14.0,
                      height: 14.0,
                      backgroundColor: ColorX.theme,
                    ),
                    rightAction: () {
                      controller.btnLoginClicked();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextX(
                    controller.version,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: ColorX.black,
                  ),
                ),
              ],
            )));
  }
}
