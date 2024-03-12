import 'dart:async';
import 'mbx_apis.dart';

class MbxLoginVM {
  static Future<MbxApiResponse> request({required String phone}) {
    final params = {
      'phone': phone,
    };
    return MbxApi.post(
            endpoint: '/login',
            params: params,
            headers: {},
            contractFile: 'lib/contracts/MbxLoginContract.json',
            contract: true)
        .then((resp) async {
      return resp;
    });
  }
}
