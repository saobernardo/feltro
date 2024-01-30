//import 'dart:ui';

import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';

class SimpleInputController1 extends StatefulWidget {
  final TextEditingController? textController;
  final bool? showIcon;
  final IconData? icon;
  final hintText;
  final bool enable;
  final Color? inputColor;
  SimpleInputController1(
      {this.textController,
      this.hintText,
      this.showIcon,
      this.icon,
      this.enable = true,
      this.inputColor});

  @override
  _SimpleInputController1State createState() => _SimpleInputController1State();
}

class _SimpleInputController1State extends State<SimpleInputController1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Campo não pode estar vazio!';
          }
          return null;
        },
        controller: widget.textController,
        enabled: widget.enable,
        decoration: widget.showIcon!
            ? new InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
                prefixIcon: Icon(
                  widget.icon,
                  color: widget.inputColor != null
                      ? widget.inputColor
                      : Theme.of(context).primaryColor,
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
                  borderSide:
                      BorderSide(color: AppColorLight.redColor, width: 2.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide:
                      BorderSide(color: AppColorLight.redColor, width: 2.0),
                ),
              )
            : new InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
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
                  borderSide:
                      BorderSide(color: AppColorLight.redColor, width: 2.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide:
                      BorderSide(color: AppColorLight.redColor, width: 2.0),
                ),
              ),
      ),
    );
  }
}
