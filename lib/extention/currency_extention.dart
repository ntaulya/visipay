import 'package:intl/intl.dart';

extension CurrencyFormatter on num {
  String get toRupiahWithSymbol => NumberFormat.currency(
        locale: 'id_ID',
        name: 'IDR',
        symbol: 'Rp ',
        decimalDigits: 0,
      ).format(this);
  String get toRupiahWithoutSymbol => NumberFormat.currency(
        locale: 'id_ID',
        name: 'IDR',
        symbol: '',
        decimalDigits: 0,
      ).format(this);
}