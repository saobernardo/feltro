import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';

class InputPassController extends StatefulWidget {
  final TextEditingController? textController;
  final bool obscure;
  final hintText;
  final VoidCallback? onTap;
  final Color? inputColor;
  final String? labelText;
  final bool validatorLength;
  InputPassController(
      {this.textController,
      this.hintText,
      this.obscure = true,
      this.onTap,
      this.inputColor,
      this.labelText,
      this.validatorLength = true});

  @override
  _InputPassControllerState createState() => _InputPassControllerState();
}

class _InputPassControllerState extends State<InputPassController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Campo não pode estar vazio!';
          }
          if (value.length < 8 && widget.validatorLength) {
            return 'Sua senha deve possuir no mínimo 8 caracteres';
          }
          return null;
        },
        controller: widget.textController,
        obscureText: widget.obscure,
        cursorColor: Theme.of(context).colorScheme.background,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        decoration: new InputDecoration(
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          contentPadding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
          prefixIcon: Icon(
            Icons.lock,
            color: widget.inputColor != null
                ? widget.inputColor
                : Theme.of(context).primaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: widget.onTap,
            child: Icon(
              widget.obscure ? Icons.visibility_off : Icons.visibility,
              color: widget.inputColor != null
                  ? widget.inputColor
                  : Theme.of(context).primaryColor,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.inputColor != null
                ? widget.inputColor
                : Theme.of(context).primaryColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
                // color:Theme.of(context).primaryColor,
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
