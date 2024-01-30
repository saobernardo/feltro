import 'package:flutter/material.dart';

Widget itemGestorMenu(
    {@required BuildContext? context, VoidCallback? onTap, String? title}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 0.0),
      height: 50,
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '$title',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Theme.of(context!).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    ),
  );
}
