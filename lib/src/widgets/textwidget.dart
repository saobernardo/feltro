import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? title;
  const TextWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Text(
          '$title',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16,
          ),
        ));
  }
}

class TitleTextWidget extends StatelessWidget {
  final String? title;
  const TitleTextWidget({Key? key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      textAlign: TextAlign.center,
      textScaleFactor: 1.0,
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface),
    );
  }
}

class SubtitleTextWidget extends StatelessWidget {
  final String? title;
  final double size;
  final bool center;
  final bool bold;
  const SubtitleTextWidget(
      {Key? key,
      @required this.title,
      this.size = 14,
      this.center = true,
      this.bold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Text(title!,
            textAlign: center ? TextAlign.center : TextAlign.start,
            style: TextStyle(
                fontSize: size,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                color: Theme.of(context).colorScheme.onSurface)));
  }
}
