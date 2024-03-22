import 'viewmodels/mbx_anti_jailbreak_vm.dart';
import 'viewmodels/mbx_preferences_vm+users.dart';
import 'viewmodels/mbx_preferences_vm.dart';
import 'viewmodels/mbx_profile_vm.dart';
import 'viewmodels/mbx_reachability_vm.dart';
import 'views/mbx_bottom_navbar_screen/mbx_bottom_navbar_screen.dart';
import 'views/mbx_onboarding_screen/mbx_onboarding_screen.dart';
import 'widgets/all_widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MbxAntiJailbreakVM.check();
  MbxReachabilityVM.startListening();

  final freshInstall = await MbxPreferencesVM.getFreshInstall();
  if (freshInstall == true) {
    await MbxPreferencesVM.setFreshInstall(false);
    await MbxUserPreferencesVM.resetAll();
  }

  final theme = await MbxUserPreferencesVM.getTheme();
  if (theme.isNotEmpty) {
    ColorX.theme = hexToColor(await MbxUserPreferencesVM.getTheme());
  } else {
    ColorX.theme = Color(0xfff44336);
    final hex = '#${ColorX.theme.value.toRadixString(16)}';
    MbxUserPreferencesVM.setTheme(hex);
  }
  await MbxProfileVM.load();

  Widget firstScreen;

  if (MbxProfileVM.profile.token.isEmpty) {
    firstScreen = MbxOnboardingScreen();
  } else {
    firstScreen = MbxBottomNavBarScreen();
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(
      ContainerX(
        backgroundColor: ColorX.white,
        child: Center(
          child: Container(
            width: kIsWeb ? 400.0 : double.infinity,
            child: MyApp(firstScreen),
          ),
        ),
      ),
    );
  });
/*
  if (MbxSessionVM.token.isNotEmpty) {
    MbxSessionVM.checkPinAndBiometric();
  } */
}

class MyApp extends StatelessWidget {
  final Widget firstScreen;
  MyApp(this.firstScreen);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      popGesture: true,
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      scrollBehavior: AppScrollBehavior(),
      title: 'DemoMBanking',
      home: firstScreen,
      theme: ThemeData(
          bottomSheetTheme:
              BottomSheetThemeData(surfaceTintColor: Colors.white),
          splashColor: Colors.transparent,
          visualDensity: VisualDensity.standard,
          primarySwatch: Colors.grey,
          fontFamily: 'Roboto',
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          })),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
