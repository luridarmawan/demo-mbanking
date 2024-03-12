import 'dart:async';
import '../models/mbx_profile_model.dart';
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
      }
      return resp;
    });
  }
}
