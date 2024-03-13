import 'dart:async';
import 'package:demombanking/viewmodels/mbx_preferences_vm+users.dart';

import '../models/mbx_profile_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

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
      profile = MbxProfileModel();
      if (resp.statusCode == 200) {
        profile.decode(resp.jason['result']);
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
}
