import 'package:flutter/material.dart';

Widget beloadCircular({Color? color}) {
  return Center(
      child: CircularProgressIndicator.adaptive(
    valueColor: AlwaysStoppedAnimation<Color>(
        color != null ? color : Color(0xffffffff)),
  ));
}
