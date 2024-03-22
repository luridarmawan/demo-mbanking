import 'package:intl/intl.dart';

class MbxFormatVM {
  static String currencyIDR(
      {required value, bool prefix = true, bool masked = false}) {
    final currencyFormatter = NumberFormat('#,##0', 'ID');
    if (prefix == true) {
      if (masked) {
        return 'IDR ***.***';
      } else {
        return 'IDR ${currencyFormatter.format(value)}';
      }
    } else {
      if (masked) {
        return '***.***';
      } else {
        return '${currencyFormatter.format(value)}';
      }
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
