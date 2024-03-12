import 'dart:async';
import 'mbx_apis.dart';
import 'mbx_preferences_vm+users.dart';

class MbxLoginOtpVM {
  static Future<MbxApiResponse> request(
      {required String phone, required String otp}) {
    final params = {
      'phone': phone,
      'otp': otp,
    };
    return MbxApi.post(
            endpoint: '/login/otp',
            params: params,
            headers: {},
            contractFile: 'lib/contracts/MbxLoginOtpContract.json',
            contract: true)
        .then((resp) async {
      if (resp.statusCode == 200) {
        final token = resp.jason['result']['token'].stringValue;
        MbxUserPreferencesVM.setToken(token);
      } else {}
      return resp;
    });
  }
}
