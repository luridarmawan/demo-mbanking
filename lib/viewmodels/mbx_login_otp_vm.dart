import 'dart:async';
import 'mbx_apis.dart';
import 'mbx_profile_vm.dart';

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
        MbxProfileVM.profile.token = resp.jason['data']['token'].stringValue;
        MbxProfileVM.save();
      } else {}
      return resp;
    });
  }
}
