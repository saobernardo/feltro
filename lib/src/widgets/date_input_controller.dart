import 'package:church_app/assets/styles/colors.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputController extends StatefulWidget {
  final String? title;
  final bool valid;
  final TextEditingController? controller;
  final Function(String value)? onDateSelected;
  final Function(String value)? onChanged;
  const DateInputController(
      {Key? key,
      this.valid = false,
      this.onChanged,
      this.title,
      this.controller,
      this.onDateSelected})
      : super(key: key);

  @override
  _DateInputControllerState createState() => _DateInputControllerState();
}

class _DateInputControllerState extends State<DateInputController> {
  textListener() {
    setState(() {
      widget.onChanged!(widget.controller!.text);
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller!.addListener(textListener);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          secondaryHeaderColor: AppColorLight.secondaryColor,
          scaffoldBackgroundColor: AppColorLight.lightPrimary,
          colorScheme: ColorScheme(
            primary: AppColorLight.lightAccent,
            //primaryVariant: AppColorLight.lightPrimaryVariant,
            secondary: AppColorLight.lightAccent,
            //secondaryVariant: AppColorLight.lightAccent,
            background: AppColorLight.lightBG,
            error: AppColorLight.redColor,
            onPrimary: AppColorLight.lightPrimary,
            onSecondary: AppColorLight.lightAccent,
            onBackground: AppColorLight.lightPrimary,
            onError: AppColorLight.redColor,
            brightness: Brightness.dark,
            surface: Colors.orange,
            onSurface: AppColorLight.lightBG,
          )),
      child: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
        child: DateTimeField(
          decoration: new InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10.0, 9.0, 10.0, 9.0),
            prefixIcon: Icon(
              Icons.date_range,
              color: Theme.of(context).colorScheme.background,
            ),
            labelText: widget.title,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.background,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.6),
                    width: 2.0)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
          controller: widget.controller,
          validator: (value) {
            if (widget.controller!.text.isEmpty && widget.valid) {
              return 'Campo não pode estar vazio!';
            }
            return null;
          },
          format: DateFormat("dd/MM/yyyy"),
          style: TextStyle(color: Colors.white),
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                initialEntryMode: DatePickerEntryMode.input,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));

            if (date != null) {
              setState(() {
                widget.onDateSelected!(date.toString());
              });
              return date;
            } else {
              return currentValue;
            }
          },
        ),
      ),
    );
  }
}
