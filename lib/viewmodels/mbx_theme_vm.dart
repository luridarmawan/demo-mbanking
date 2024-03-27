import '../views/mbx_theme_sheet/mbx_theme_sheet.dart';
import '../widgets/all_widgets.dart';
import 'mbx_preferences_vm+users.dart';

class MbxThemeVM {
  static Future<T?> change<T>() async {
    final sheet = MbxThemeSheet();
    final value = await sheet.show();
    await MbxUserPreferencesVM.setTheme(value);
    ColorX.theme = hexToColor(value);
    return value;
  }
}
