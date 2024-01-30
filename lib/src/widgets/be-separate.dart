import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';

Widget beSeparate(BuildContext context, {double height = 10}) {
  return Column(
    children: <Widget>[
      SizedBox(height: height),
      Container(
        color: AppColorLight.secondFontDefaultColor,
        width: MediaQuery.of(context).size.width,
        height: 1,
      ),
      SizedBox(height: height)
    ],
  );
}
