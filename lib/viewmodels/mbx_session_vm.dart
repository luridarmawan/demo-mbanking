import 'dart:io';
import 'package:demombanking/viewmodels/mbx_profile_vm.dart';
import 'package:flutter/services.dart';
import 'mbx_preferences_vm+users.dart';

class MbxSessionVM {
  static String token = '';

  static load() async {
    token = await MbxUserPreferencesVM.getToken();
    await MbxProfileVM.load();
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
