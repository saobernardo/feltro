import 'package:brasil_fields/brasil_fields.dart';
//import 'package:cpf_cnpj_validator/cpf_validator.dart';
//import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../input_date_controller/date_formatter.dart';
import 'formatters/br_telefone_input_formatter.dart';
import 'formatters/credit_card_formatter.dart';
import 'formatters/currency_input_formatter.dart';
import 'formatters/mmyy_formatter.dart';
import 'formatters/mmyyyy_formatter.dart';
import 'formatters/time_formatter.dart';

enum TypeInput {
  NONE,
  PASSWORD,
  EMAIL,
  @deprecated
  // you need to use NUMBER
  COUNTER,
  NUMBER,
  CURRENCY,

  // brasil
  CPF,
  CNPJ,
  CEP,
  BR_TEL,
  CREDIT_CARD,
  MMYY,
  MMYYYY,
  DATE,
  TIME
}

class BeInputController extends StatefulWidget {
  final TextEditingController? controller;
  final bool fulwidth;
  final double? width;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final hintText;
  final labelText;
  final bool enable;
  final bool obscure;
  final TypeInput? typeInput;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onPrefixTap;
  final bool readOnly;
  final bool enableInteractiveSelection;
  final EdgeInsetsGeometry? padding;
  final bool validator;
  final bool emailPhoneValidator;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final VoidCallback? onEditingComplete;
  final Color? fillColor;
  final bool centerText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool showBorder;
  final Widget? prefix;
  final Widget? suffix;
  final double? borderRadius;
  final double? height;
  final TextStyle? style;
  final Color? cursorColor;
  @deprecated
  final Color? iconColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final EdgeInsetsGeometry? sufixIconpadding;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;

  BeInputController(
      {this.controller,
      this.width,
      this.height,
      this.fulwidth = true,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.enable = true,
      this.obscure = true,
      this.typeInput,
      this.inputFormatters,
      this.keyboardType,
      this.onSuffixTap,
      this.onEditingComplete,
      this.onPrefixTap,
      this.padding,
      this.enableInteractiveSelection = true,
      this.readOnly = false,
      this.onChanged,
      this.onSubmit,
      this.centerText = false,
      this.fillColor,
      this.labelStyle,
      this.hintStyle,
      this.contentPadding,
      this.showBorder = true,
      this.prefix,
      this.suffix,
      this.borderRadius,
      this.style,
      this.sufixIconpadding,
      this.iconColor,
      this.autofocus = false,
      this.validator = false,
      this.emailPhoneValidator = false,
      this.textCapitalization = TextCapitalization.none,
      this.prefixIconColor,
      this.suffixIconColor,
      this.cursorColor,
      this.focusNode
      // this.emailvalidator = false,
      // this.phoneValidator = false,
      });

  @override
  _BeInputControllerState createState() => _BeInputControllerState();
}

class _BeInputControllerState extends State<BeInputController> {
  bool isEmail(String input) => EmailValidator.validate(input);

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fulwidth ? MediaQuery.of(context).size.width : widget.width,
      height: widget.height != null ? widget.height : null,
      padding: widget.padding != null
          ? widget.padding
          : EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextFormField(
          validator: (value) {
            if (value!.isEmpty && widget.validator) {
              return 'Campo não pode estar vazio!';
            }
            if (!CPFValidator.isValid(value) &&
                widget.validator &&
                widget.typeInput == TypeInput.CPF) {
              return 'CPF inválido!';
            }
            if (!CNPJValidator.isValid(value) &&
                widget.validator &&
                widget.typeInput == TypeInput.CNPJ) {
              return 'CNPJ inválido!';
            }
            if (!isEmail(value) &&
                !isPhone(value) &&
                widget.emailPhoneValidator) {
              return 'Por favor, insira um e-mail ou número de telefone válido.';
            }
            if (!isEmail(value.trim()) &&
                widget.validator &&
                widget.typeInput == TypeInput.EMAIL) {
              return 'E-mail inválido.';
            }
            return null;
          },
          onChanged: widget.onChanged,
          textCapitalization: widget.textCapitalization,
          onFieldSubmitted: widget.onSubmit,
          onEditingComplete: widget.onEditingComplete,
          controller: widget.controller,
          autofocus: widget.autofocus,
          textAlign: widget.centerText ? TextAlign.center : TextAlign.start,
          enabled: widget.enable,
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          showCursor: true,
          style: widget.style != null
              ? widget.style
              : TextStyle(
                  fontSize: 15,
                ),
          obscureText: widget.typeInput == TypeInput.PASSWORD && widget.obscure
              ? true
              : false,
          inputFormatters: widget.typeInput != null
              ? defineTypeformatters(widget.typeInput!)
              : null,
          keyboardType: widget.typeInput != null
              ? defineTypeInput(widget.typeInput!)
              : null,
          maxLines: widget.keyboardType == TextInputType.multiline ? null : 1,
          cursorColor: widget.cursorColor != null
              ? widget.cursorColor
              : Theme.of(context).colorScheme.secondary,
          decoration: new InputDecoration(
            prefix: widget.prefix != null ? widget.prefix : null,
            border: widget.showBorder && widget.borderRadius == null
                ? null
                : OutlineInputBorder(
                    borderRadius: widget.borderRadius != null
                        ? BorderRadius.circular(widget.borderRadius!)
                        : BorderRadius.circular(1.0),
                    borderSide:
                        widget.showBorder ? BorderSide() : BorderSide.none),
            contentPadding:
                widget.contentPadding != null ? widget.contentPadding : null,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            fillColor: widget.fillColor != null ? widget.fillColor : null,
            filled: widget.fillColor != null ? true : false,
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon != null &&
                    (widget.typeInput == TypeInput.PASSWORD ||
                        widget.typeInput == TypeInput.COUNTER ||
                        widget.typeInput == TypeInput.DATE ||
                        widget.typeInput == TypeInput.TIME ||
                        widget.typeInput == TypeInput.NUMBER ||
                        widget.typeInput == TypeInput.CURRENCY ||
                        widget.typeInput == TypeInput.CEP ||
                        widget.typeInput == TypeInput.EMAIL)
                ? Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: IconButton(
                        icon: Icon(widget.suffixIcon),
                        iconSize: 20,
                        color: widget.suffixIconColor != null
                            ? widget.suffixIconColor
                            : null,
                        onPressed: widget.onSuffixTap))
                : widget.suffixIcon != null
                    ? Padding(
                        padding: widget.sufixIconpadding != null
                            ? widget.sufixIconpadding!
                            : EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Icon(widget.suffixIcon,
                            size: 20,
                            color: widget.suffixIconColor != null
                                ? widget.suffixIconColor
                                : null),
                      )
                    : null,
            prefixIcon: widget.prefixIcon != null &&
                    (widget.typeInput == TypeInput.COUNTER ||
                        widget.typeInput == TypeInput.DATE ||
                        widget.typeInput == TypeInput.TIME ||
                        widget.typeInput == TypeInput.NUMBER ||
                        widget.typeInput == TypeInput.CURRENCY ||
                        widget.typeInput == TypeInput.CEP)
                ? IconButton(
                    icon: Icon(widget.prefixIcon),
                    // color: widget.iconColor != null ? widget.iconColor : null,
                    color: widget.prefixIconColor != null
                        ? widget.prefixIconColor
                        : null,
                    onPressed: widget.onPrefixTap,
                  )
                : widget.prefixIcon != null
                    ? Icon(
                        widget.prefixIcon,
                        color: widget.prefixIconColor != null
                            ? widget.prefixIconColor
                            : null,
                      )
                    : null,
            labelText: widget.labelText,
            hintText: widget.hintText ?? widget.hintText,
            hintStyle: widget.hintStyle != null
                ? widget.hintStyle
                : TextStyle(
                    fontSize: 15,
                  ),
            labelStyle: widget.labelStyle != null
                ? widget.labelStyle
                : TextStyle(
                    fontSize: 15,
                  ),
          )),
    );
  }

  List<TextInputFormatter> defineTypeformatters(TypeInput typeInput) {
    if (typeInput == TypeInput.CPF) {
      return [FilteringTextInputFormatter.digitsOnly, CpfInputFormatter()];
    } else if (typeInput == TypeInput.CNPJ) {
      return [FilteringTextInputFormatter.digitsOnly, CnpjInputFormatter()];
    } else if (typeInput == TypeInput.CEP) {
      return [FilteringTextInputFormatter.digitsOnly, CepInputFormatter()];
    } else if (typeInput == TypeInput.BR_TEL) {
      return [
        FilteringTextInputFormatter.digitsOnly,
        BrtelefoneInputFormatter()
      ];
    } else if (typeInput == TypeInput.CREDIT_CARD) {
      return [FilteringTextInputFormatter.digitsOnly, CreditCardFormatter()];
    } else if (typeInput == TypeInput.MMYY) {
      return [FilteringTextInputFormatter.digitsOnly, MMYYFormatter()];
    } else if (typeInput == TypeInput.MMYYYY) {
      return [FilteringTextInputFormatter.digitsOnly, MMYYYYFormatter()];
    } else if (typeInput == TypeInput.DATE) {
      return [FilteringTextInputFormatter.digitsOnly, DATEFormatter()];
    } else if (typeInput == TypeInput.TIME) {
      return [FilteringTextInputFormatter.digitsOnly, TIMEFormatter()];
    } else if (typeInput == TypeInput.CURRENCY) {
      return [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(showprefix: true)
      ];
    }
    // retorno o widget defaut que pode seu utilizado pelo usuario se quize
    else
      return widget.inputFormatters!;
  }

  TextInputType defineTypeInput(TypeInput typeInput) {
    if (typeInput == TypeInput.TIME ||
        typeInput == TypeInput.MMYY ||
        typeInput == TypeInput.MMYYYY ||
        typeInput == TypeInput.DATE ||
        typeInput == TypeInput.CREDIT_CARD ||
        typeInput == TypeInput.CPF ||
        typeInput == TypeInput.CNPJ ||
        typeInput == TypeInput.CEP ||
        typeInput == TypeInput.BR_TEL ||
        typeInput == TypeInput.COUNTER ||
        typeInput == TypeInput.CURRENCY ||
        widget.typeInput == TypeInput.NUMBER) {
      return TextInputType.number;
    } else if (typeInput == TypeInput.EMAIL) {
      return TextInputType.emailAddress;
    }
    // retorno o widget defaut que pode seu utilizado pelo usuario se quize
    else
      return widget.keyboardType!;
  }
}
