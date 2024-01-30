import 'package:church_app/assets/styles/colors.dart';
import 'package:church_app/src/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class CheckOptions extends StatefulWidget {
  final Function(dynamic)? okChecked;
  final Function(dynamic)? noChecked;
  final String? title;
  final String oklabel;
  final String nolabel;
  final bool okInitial;
  const CheckOptions(
      {Key? key,
      this.okInitial = true,
      this.title,
      this.oklabel = '',
      this.nolabel = '',
      this.okChecked,
      this.noChecked})
      : super(key: key);

  @override
  _CheckOptionsState createState() => _CheckOptionsState();
}

class _CheckOptionsState extends State<CheckOptions> {
  bool okChecked = true;
  bool noChecked = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      okChecked = widget.okInitial ? true : false;
      noChecked = widget.okInitial ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
      child: Column(children: [
        TextWidget(title: widget.title!),
        SizedBox(height: 5),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: okChecked
                          ? Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(.4)
                          : null,
                      borderRadius: BorderRadius.circular(5)),
                  child: CheckboxListTile(
                    tileColor:
                        Theme.of(context).colorScheme.secondary.withOpacity(.2),
                    checkColor: AppColorLight.fontButtonsColor,
                    activeColor: AppColorLight.selectedTabColor,
                    title: Text(widget.oklabel,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: AppColorLight.fontButtonsColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    value: okChecked,
                    onChanged: (newValue) {
                      setState(() {
                        okChecked = true;
                        noChecked = false;
                      });
                      widget.okChecked!(true);
                    },
                  ),
                ),
              ),
              if (widget.nolabel != '')
                Expanded(
                    flex: 1,
                    child: Container(
                        decoration: BoxDecoration(
                            color: noChecked
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(.4)
                                : null,
                            borderRadius: BorderRadius.circular(5)),
                        child: CheckboxListTile(
                            tileColor: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(.2),
                            checkColor: AppColorLight.fontButtonsColor,
                            activeColor: AppColorLight.selectedTabColor,
                            title: Text(widget.nolabel,
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: AppColorLight.fontButtonsColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            value: noChecked,
                            onChanged: (newValue) {
                              setState(() {
                                noChecked = true;
                                okChecked = false;
                                widget.noChecked!(true);
                              });
                            })))
            ])
      ]),
    );
  }
}
