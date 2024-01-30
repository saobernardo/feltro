import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomPassController extends StatefulWidget {
  final TextEditingController? textController;
  final bool? obscure;
  final hintText;
  final VoidCallback? onTap;
  final Color? inputColor;
  CustomPassController(
      {this.textController,
      this.hintText,
      this.obscure,
      this.onTap,
      this.inputColor});

  @override
  _CustomPassControllerState createState() => _CustomPassControllerState();
}

class _CustomPassControllerState extends State<CustomPassController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Campo não pode estar vazio!';
          }
          return null;
        },
        controller: widget.textController,
        obscureText: widget.obscure!,
        decoration: new InputDecoration(
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
              widget.obscure! ? Icons.visibility_off : Icons.visibility,
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
