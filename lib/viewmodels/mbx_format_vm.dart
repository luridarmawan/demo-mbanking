import 'package:intl/intl.dart';

class MbxFormatVM {
  static String currencyIDR({required value, bool prefix = true}) {
    final currencyFormatter = NumberFormat('#,##0', 'ID');
    if (prefix == true) {
      return 'IDR ${currencyFormatter.format(value)}';
    } else {
      return '${currencyFormatter.format(value)}';
    }
  }

  static String currencyUSD({required value, bool prefix = true}) {
    final currencyFormatter = NumberFormat('#,##0', 'EN');
    if (prefix == true) {
      return 'USD ${currencyFormatter.format(value)}';
    } else {
      return '${currencyFormatter.format(value)}';
    }
  }

  static String accountMasking(
      {required String value,
      required String prefix,
      required int visibleDigits}) {
    return '$prefix${value.substring(value.length - visibleDigits)}';
  }
}
