import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';

PreferredSize preferredAppbar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(0.0),
    child: AppBar(
      elevation: 0.0,
      backgroundColor: AppColorLight.lightPrimary,
    ),
  );
}
