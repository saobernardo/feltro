import 'package:flutter/cupertino.dart';

class SizeConfig {
  final MediaQueryData? mediaQueryData;

  SizeConfig({this.mediaQueryData});

  static SizeConfig of(BuildContext context) =>
      SizeConfig(mediaQueryData: MediaQuery.of(context));

  double dynamicScaleSize(
      {double? size, double? scaleFactorTablet, double? scaleFactorMini}) {
    if (isTablet()) {
      final scaleFactor = scaleFactorTablet ?? 2;

      return size! * scaleFactor;
    }

    if (isMini()) {
      final scaleFactor = scaleFactorMini ?? 0.8;

      return size! * scaleFactor;
    }

    return size!;
  }

  bool isTablet() {
    return mediaQueryData!.size.shortestSide > 600;
  }

  bool isMini() {
    return mediaQueryData!.size.shortestSide <= 320;
  }
}
