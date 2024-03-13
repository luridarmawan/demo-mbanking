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

  static Future<void> setProfile(String value) async {
    await MbxPreferencesVM.setString(
        'ffaa1ca7884538c1f480d413a183db1c2df42f8cc5e6b48e791e07549d556796',
        value);
  }

  static Future<String> getProfile() async {
    return await MbxPreferencesVM.getString(
        'ffaa1ca7884538c1f480d413a183db1c2df42f8cc5e6b48e791e07549d556796');
  }

  static Future<void> resetAll() async {
    await setToken('');
    await setProfile('');
    await MbxPreferencesVM.deleteAll();
  }
}
