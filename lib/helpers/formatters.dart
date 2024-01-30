import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formatters {
  static String formatCPF(String? value) {
    if (value == null) return "Não informado";
    var cpfController =
        new MaskedTextController(text: '$value', mask: '000.000.000-00');
    cpfController.updateMask('000.000.000-00');
    return cpfController.text;
  }

  static double converterMoedaParaDouble(String valor) {
    assert(valor.isNotEmpty);
    final value = double.tryParse(
        valor.replaceAll('R\$', '').replaceAll('.', '').replaceAll(',', '.'));
    return value ?? 0;
  }

  static String formatCNPJ(String? value) {
    if (value == null) return "Não informado";
    var cnpjController =
        new MaskedTextController(text: '$value', mask: '00.000.000/0000-00');
    cnpjController.updateMask('00.000.000/0000-00');
    return cnpjController.text;
  }

  static String formatPHONEBR(String value) {
    // +(55) 54 9 9841-4239
    var phoneController =
        new MaskedTextController(text: '$value', mask: '+(00)0000-000000');
    phoneController.updateMask('(00) 00000-00000');
    return phoneController.text;
  }

  static String formatCEP(String value) {
    // +(55) 54 9841-4239
    var phoneController =
        new MaskedTextController(text: '$value', mask: '00000-000');
    phoneController.updateMask('00000-000');
    return phoneController.text;
  }

  static String formatDateString(String? value) {
    if (value == null) return '';
    DateTime todayDate = DateTime.parse(value);
    return DateFormat('dd/MM/yyyy').format(todayDate);
  }

  static String formatStringDate(String? value) {
    if (value != null && value != '') {
      // return DateFormat('dd/MM/yyyy').parse(value).toString();
      return DateFormat('yyyy-MM-dd')
          .format(DateFormat('dd/MM/yyyy').parse(value));
    }
    return 'Não informado';
  }

  static String formatStringDateYear(String? value) {
    if (value != null && value != '') {
      // return DateFormat('dd/MM/yyyy').parse(value).toString();
      return DateFormat('yyyy').format(DateFormat('dd/MM/yyyy').parse(value));
    }
    return 'Não informado';
  }

  static String formatCurrencyPTBR(String? value) {
    if (value == null) return '';
    if (value == '') return '';
    double temp = double.parse(value);
    return NumberFormat.currency(
            symbol: "R\$", decimalDigits: 2, locale: "pt-br")
        .format(temp)
        .toString();
  }

  static MaskTextInputFormatter phoneFormat() {
    return new MaskTextInputFormatter(
        mask: '(##) # ####-####', filter: {"#": RegExp(r'[0-9]')});
  }
}
