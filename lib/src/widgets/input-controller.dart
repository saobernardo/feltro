import 'package:brasil_fields/brasil_fields.dart';
import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

class SimpleInputController extends StatefulWidget {
  final TextEditingController? textController;
  final bool? showIcon;
  final IconData? prefixIcon;
  final String? hintText;
  final bool enable;
  final Color? inputColor;
  final IconData? sufixIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onSufixtap;
  final int? maxLines;
  final Function(String)? onChanged;
  final bool validator;
  final bool validatorEmail;
  final bool validatorPhone;
  final String? labelText;

  SimpleInputController(
      {this.textController,
      this.maxLines,
      this.hintText,
      this.showIcon,
      this.sufixIcon,
      this.prefixIcon,
      this.enable = true,
      this.inputColor,
      this.textInputType,
      this.onSufixtap,
      this.inputFormatters,
      this.onChanged,
      this.validator = true,
      this.validatorEmail = false,
      this.validatorPhone = false,
      this.labelText});

  @override
  _SimpleInputControllerState createState() => _SimpleInputControllerState();
}

class _SimpleInputControllerState extends State<SimpleInputController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
            validator: (value) {
              if (value!.isEmpty && widget.validator) {
                return 'Campo não pode estar vazio!';
              }
              if (!EmailValidator.validate(value) &&
                  widget.validatorEmail == true &&
                  value.isNotEmpty) {
                return 'E-mail inválido!';
              }
              if (value.isNotEmpty &&
                  UtilBrasilFields.removeCaracteres(value).length < 10 &&
                  widget.validatorPhone) {
                return 'Telefone inválido!';
              }
              return null;
            },
            controller: widget.textController,
            enabled: widget.enable,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            keyboardType: widget.textInputType,
            maxLines: widget.maxLines != null ? widget.maxLines : null,
            onChanged: widget.onChanged,
            cursorColor: Theme.of(context).colorScheme.background,
            inputFormatters: widget.inputFormatters,
            decoration: new InputDecoration(
              labelText: widget.labelText != null ? widget.labelText : '',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onSurface),
              contentPadding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: widget.inputColor != null
                          ? widget.inputColor
                          : Theme.of(context).colorScheme.onSurface,
                    )
                  : null,
              hintText: widget.hintText != null ? widget.hintText : null,
              suffixIcon: widget.sufixIcon != null
                  ? InkWell(
                      onTap: widget.onSufixtap,
                      child: Icon(
                        widget.sufixIcon,
                        color: widget.inputColor != null
                            ? widget.inputColor
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                    )
                  : null,
              hintStyle: TextStyle(
                color: widget.inputColor != null
                    ? widget.inputColor
                    : AppColorLight.lightBG,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide(
                    color: widget.inputColor != null
                        ? widget.inputColor!
                        : Theme.of(context).colorScheme.background,
                    width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide(
                    color: widget.inputColor != null
                        ? widget.inputColor!.withOpacity(0.6)
                        : Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.6),
                    width: 2.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide(
                    color: widget.inputColor != null
                        ? widget.inputColor!.withOpacity(0.6)
                        : Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                    width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide:
                    BorderSide(color: AppColorLight.redColor, width: 2.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide:
                    BorderSide(color: AppColorLight.redColor, width: 2.0),
              ),
            )));
  }
}
