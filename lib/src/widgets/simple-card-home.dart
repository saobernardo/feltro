import 'package:church_app/helpers/sizeconfig.dart';
import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';

class SimpleCardhome extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;
  final IconData? icon;
  final String? button;

  SimpleCardhome(
      {Key? key,
      @required this.title,
      this.subtitle,
      this.icon,
      @required this.onTap,
      this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeconfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    return Expanded(
      flex: 1,
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColorLight.lightPrimaryVariant,
            border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title!,
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: AppColorLight.iconesAnexoColor,
                  fontWeight: FontWeight.bold,
                  fontSize: sizeconfig.dynamicScaleSize(
                      size: 13, scaleFactorTablet: 1.5),
                ),
              ),
              icon != null
                  ? Icon(icon, size: 50, color: AppColorLight.iconesAnexoColor)
                  : Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          subtitle!,
                          maxLines: 3,
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColorLight.fontColorCards,
                            fontSize: sizeconfig.dynamicScaleSize(
                                size: 12, scaleFactorTablet: 1.5),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 10),
              InkWell(
                onTap: onTap,
                child: Container(
                  margin: EdgeInsets.only(bottom: 1),
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColorLight.greyButtonColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      button!,
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColorLight.fontButtonsColor,
                          fontSize: sizeconfig.dynamicScaleSize(
                              size: 13, scaleFactorTablet: 1.5)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
