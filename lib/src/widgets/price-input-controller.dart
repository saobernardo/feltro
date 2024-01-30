import 'package:church_app/assets/styles/colors.dart';
import 'package:church_app/src/util/launchApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceInputController extends StatefulWidget {
  final TextEditingController? textController;
  final bool? showIcon;
  final bool suffixIcon;
  final VoidCallback? sufixfuncion;
  final Function(String)? onChange;
  final IconData? icon;
  final hintText;
  final bool enable;
  final bool validator;
  PriceInputController(
      {this.textController,
      this.hintText,
      this.showIcon,
      this.onChange,
      this.icon,
      this.suffixIcon = false,
      this.sufixfuncion,
      this.enable = true,
      this.validator = true});

  @override
  _PriceInputControllerState createState() => _PriceInputControllerState();
}

class _PriceInputControllerState extends State<PriceInputController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty && widget.validator) {
            return 'Campo não pode estar vazio!';
          }

          return null;
        },
        controller: widget.textController,
        enabled: widget.enable,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        onChanged: widget.onChange,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        cursorColor: Theme.of(context).colorScheme.onSurface,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CurrencyPtBrInputFormatter()
        ],
        decoration: widget.showIcon!
            ? new InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
                prefixIcon: Icon(widget.icon),
                labelText: widget.hintText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                // hintText:  widget.hintText,
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                      width: 2.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.2),
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
                labelText: widget.hintText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
                suffixIcon: widget.suffixIcon
                    ? IconButton(
                        icon: Icon(Icons.search),
                        onPressed: widget.sufixfuncion)
                    : null,
                contentPadding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                      width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                        width: 2.0)),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.2),
                      width: 2.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide:
                      BorderSide(color: AppColorLight.redColor, width: 1.0),
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
