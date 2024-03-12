import 'dart:io';
import 'package:flutter/services.dart';
import 'mbx_preferences_vm+users.dart';

class MbxSessionVM {
  static String token = '';

  static load() async {
    token = await MbxUserPreferencesVM.getToken();
  }

  static logout() async {
    token = '';
    await MbxUserPreferencesVM.resetAll();
  }

  static void forceQuit() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
