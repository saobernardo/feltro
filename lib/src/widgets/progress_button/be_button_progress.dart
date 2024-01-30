import 'package:church_app/src/widgets/progress_button/progress_button.dart';
import 'package:flutter/material.dart';

class BeButtonProgress extends StatelessWidget {
  final Function? onTap;
  final String? label;
  final bool enabled;
  final Color? bgColor;
  final EdgeInsetsGeometry? margin;
  final Widget? progressWidget;
  final Widget? defaultLabel;
  final Color? colorProgress;
  final double radius;
  final ProgressButtonType progressButtonType;

  BeButtonProgress(
      {Key? key,
      @required this.onTap,
      @required this.label,
      this.enabled = true,
      this.progressWidget,
      this.bgColor,
      this.colorProgress,
      this.radius = 20,
      this.defaultLabel,
      this.progressButtonType = ProgressButtonType.Flat,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: margin != null
          ? margin
          : const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
      alignment: Alignment.center,
      child: ProgressButton(
          type: progressButtonType,
          defaultWidget: defaultLabel != null
              ? defaultLabel!
              : Text(label!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge),
          progressWidget: progressWidget != null
              ? progressWidget!
              : CircularProgressIndicator(
                  valueColor: colorProgress != null
                      ? AlwaysStoppedAnimation<Color>(colorProgress!)
                      : AlwaysStoppedAnimation<Color>(Colors.white)),
          color: !enabled
              ? Colors.grey
              : bgColor != null
                  ? bgColor!
                  : Theme.of(context).colorScheme.primaryContainer,
          borderRadius: radius,
          height: 50,
          onPressed: enabled ? onTap! : () {}),
    );
  }
}
