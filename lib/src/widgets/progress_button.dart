import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';

import 'progress_button/progress_button.dart';

class ProgressButtom extends StatefulWidget {
  final String? text;
  final Function? onTap;
  final EdgeInsetsGeometry? spacer;

  const ProgressButtom({Key? key, this.onTap, this.text, this.spacer})
      : super(key: key);

  @override
  _ProgressButtomState createState() => _ProgressButtomState();
}

class _ProgressButtomState extends State<ProgressButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: widget.spacer != null
            ? widget.spacer
            : const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
        alignment: Alignment.center,
        child: ProgressButton(
            defaultWidget: Text(widget.text!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: AppColorLight.fontButtonsColor,
                    fontWeight: FontWeight.bold)),
            progressWidget: const CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColorLight.loading2Color)),
            color: AppColorLight.lightAccent,
            borderRadius: 9.0,
            height: 50,
            onPressed: widget.onTap!));
  }
}
