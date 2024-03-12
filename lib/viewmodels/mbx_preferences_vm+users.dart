import 'dart:async';
import 'mbx_preferences_vm.dart';

extension MbxUserPreferencesVM on MbxPreferencesVM {
  static Future<void> setToken(String value) async {
    await MbxPreferencesVM.setString(
        '4b4b07b3f7c5da2b11194774b2087a8cde11f3510c140865e52d4708a702f290',
        value);
  }

  static Future<String> getToken() async {
    return await MbxPreferencesVM.getString(
        '4b4b07b3f7c5da2b11194774b2087a8cde11f3510c140865e52d4708a702f290');
  }

  static Future<void> resetAll() async {
    await setToken('');
    await MbxPreferencesVM.deleteAll();
  }
}
