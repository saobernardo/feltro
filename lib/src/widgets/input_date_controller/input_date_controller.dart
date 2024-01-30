//import 'package:brasil_fields/brasil_fields.dart';
import 'package:church_app/assets/styles/colors.dart';
import 'package:church_app/src/widgets/input_date_controller/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputDateController extends StatefulWidget {
  final TextEditingController? textController;
  final bool? showIcon;
  final IconData? prefixIcon;
  final hintText;
  final bool enable;
  final Color? inputColor;
  final IconData? sufixIcon;
  final VoidCallback? onSufixtap;
  final int? maxLines;
  final Function(String)? onChanged;
  final bool validator;
  final String? labelText;
  InputDateController(
      {this.textController,
      this.maxLines,
      this.hintText,
      this.showIcon,
      this.sufixIcon,
      this.prefixIcon,
      this.enable = true,
      this.inputColor,
      this.onSufixtap,
      this.onChanged,
      this.validator = true,
      this.labelText});

  @override
  _InputDateControllerState createState() => _InputDateControllerState();
}

class _InputDateControllerState extends State<InputDateController> {
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
          return null;
        },
        controller: widget.textController,
        enabled: widget.enable,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        keyboardType: TextInputType.number,
        maxLines: widget.maxLines != null ? widget.maxLines : null,
        onChanged: widget.onChanged,
        cursorColor: Colors.white,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          DATEFormatter()
        ],
        decoration: new InputDecoration(
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(color: AppColorLight.lightBG),
          contentPadding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  color: widget.inputColor != null
                      ? widget.inputColor
                      : Theme.of(context).primaryColor,
                )
              : null,
          hintText: widget.hintText,
          suffixIcon: widget.sufixIcon != null
              ? InkWell(
                  onTap: widget.onSufixtap,
                  child: Icon(
                    widget.sufixIcon,
                    color: widget.inputColor != null
                        ? widget.inputColor
                        : Theme.of(context).primaryColor,
                  ),
                )
              : null,
          hintStyle: TextStyle(
            color: widget.inputColor != null
                ? widget.inputColor
                : Theme.of(context).primaryColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
                color: widget.inputColor != null
                    ? widget.inputColor!
                    : Theme.of(context).primaryColor,
                width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
                color: widget.inputColor != null
                    ? widget.inputColor!.withOpacity(0.6)
                    : Theme.of(context).primaryColor.withOpacity(0.6),
                width: 2.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
                color: widget.inputColor != null
                    ? widget.inputColor!.withOpacity(0.6)
                    : Theme.of(context).primaryColor.withOpacity(0.6),
                width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(color: AppColorLight.redColor, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(color: AppColorLight.redColor, width: 2.0),
          ),
        ),
      ),
    );
  }
}
