//import 'dart:ui';

import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';

class MultilineInputController extends StatefulWidget {
  final TextEditingController? textController;
  final IconData? icon;
  final hintText;
  final bool showLabel;
  final Color? inputColor;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final VoidCallback? onSufixtap;
  final Function(String)? onChanged;
  final bool validate;

  MultilineInputController(
      {this.textController,
      this.prefixIcon,
      this.sufixIcon,
      this.hintText,
      this.icon,
      this.onChanged,
      this.showLabel = false,
      this.validate = false,
      this.onSufixtap,
      this.inputColor});

  @override
  _MultilineInputControllerState createState() =>
      _MultilineInputControllerState();
}

class _MultilineInputControllerState extends State<MultilineInputController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      child: TextFormField(
          validator: (value) {
            if (value!.isEmpty && widget.validate) {
              return 'Campo não pode estar vazio!';
            }
            return null;
          },
          controller: widget.textController,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          keyboardType: TextInputType.multiline,
          maxLines: 50,
          onChanged: widget.onChanged,
          cursorColor: Theme.of(context).colorScheme.background,
          decoration: new InputDecoration(
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
                          .background
                          .withOpacity(0.6),
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
          )),
    );
  }
}
