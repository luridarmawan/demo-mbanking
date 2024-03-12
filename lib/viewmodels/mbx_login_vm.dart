import 'dart:async';
import '../models/demo_profile_model.dart';
import 'demo_apis.dart';

class MbxLoginVM {
  static var profile = DemoProfileModel();

  static Future<DemoApiResponse> request() {
    return DemoApi.get(
            endpoint: '/login',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/DemoLoginContract.json',
            contract: true)
        .then((resp) async {
      profile = DemoProfileModel();
      if (resp.statusCode == 200) {
        profile.decode(resp.jason['result']);
      }
      return resp;
    });
  }
}
