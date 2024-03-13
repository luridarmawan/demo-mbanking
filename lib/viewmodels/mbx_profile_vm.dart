import 'dart:async';
import 'dart:io';
import '../models/mbx_profile_model.dart';
import '../utils/all_utils.dart';
import '../views/mbx_onboarding_screen/mbx_onboarding_screen.dart';
import '../widgets/all_widgets.dart';
import 'mbx_apis.dart';
import 'mbx_preferences_vm+users.dart';

class MbxProfileVM {
  static var profile = MbxProfileModel();

  static Future<MbxApiResponse> request() {
    return MbxApi.get(
            endpoint: '/profile',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxProfileContract.json',
            contract: true)
        .then((resp) async {
      if (resp.statusCode == 200) {
        profile.name = resp.jason['result']['name'].stringValue;
        profile.email = resp.jason['result']['email'].stringValue;
        profile.photo = resp.jason['result']['photo'].stringValue;
        await save();
      }
      return resp;
    });
  }

  static save() async {
    final jason = profile.encode();
    await MbxUserPreferencesVM.setProfile(jason.encoded(minify: true));
    LoggerX.log('[Profile] saved:\n${jason.encoded(minify: false)}');
  }

  static load() async {
    final jsonString = await MbxUserPreferencesVM.getProfile();
    final jason = Jason.decode(jsonString);
    profile.decode(jason);
    LoggerX.log('[Profile] loaded:\n${jason.encoded(minify: false)}');
  }

  static logout() {
    profile = MbxProfileModel();
    save();
    Get.deleteAll();
    Get.offAll(MbxOnboardingScreen());
    LoggerX.log('[Profile] logout');
  }

  static void forceQuit() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
