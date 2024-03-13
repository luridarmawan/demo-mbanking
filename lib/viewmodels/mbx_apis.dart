import 'package:demombanking/viewmodels/mbx_profile_vm.dart';

import 'mbx_preferences_vm+users.dart';
import '../utils/api_x.dart';
import 'mbx_baseurl_vm.dart';

class MbxApiResponse extends ApiXResponse {
  MbxApiResponse(ApiXResponse resp) {
    headers = resp.headers;
    statusCode = resp.statusCode;
    body = resp.body;
    jason = resp.jason;
    message = resp.message;
  }
}

class MbxApi {
  static addRequiredHeader(Map<String, Object?> header) async {
    header['X-DEVICE-ID'] = 'deviceid';
    final token = MbxProfileVM.profile.token;
    if (token.isNotEmpty) {
      header['Authorization'] = 'Bearer $token';
    }
  }

  static Future<MbxApiResponse> get(
      {required String endpoint,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.get(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders)
        .then((resp) {
      final response = MbxApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static Future<MbxApiResponse> post(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      bool json = false,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.post(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders,
            json: json)
        .then((resp) {
      final response = MbxApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static Future<MbxApiResponse> delete(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.delete(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders)
        .then((resp) {
      final response = MbxApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static Future<MbxApiResponse> put(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      bool json = false,
      String contractFile = '',
      bool mock = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.put(
            url: mock == false ? MbxBaseUrlVM.apiUrl(endpoint) : contractFile,
            params: params,
            headers: newHeaders,
            json: json)
        .then((resp) {
      final response = MbxApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static Future<MbxApiResponse> postMultipart(
      {required String endpoint,
      Map<String, String?>? files,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.postMultipart(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            files: files,
            params: params,
            headers: newHeaders)
        .then((resp) {
      final response = MbxApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static Future<MbxApiResponse> putMultipart(
      {required String endpoint,
      Map<String, String?>? files,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.putMultipart(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            files: files,
            params: params,
            headers: newHeaders)
        .then((resp) {
      final response = MbxApiResponse(resp);
      handleResponse(response);
      return response;
    });
  }

  static handleResponse(MbxApiResponse resp) async {
    if (resp.statusCode == 401) {
      await MbxProfileVM.logout();
    }
  }
}
