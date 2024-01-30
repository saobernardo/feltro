import 'package:church_app/assets/styles/colors.dart';
import 'package:church_app/helpers/sizeconfig.dart';
import 'package:flutter/material.dart';

class SimpleCardhomeLive extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? horario;
  final VoidCallback? onTap;
  final String? button;
  SimpleCardhomeLive(
      {Key? key,
      @required this.title,
      this.horario,
      this.subtitle,
      @required this.onTap,
      this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeconfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height:
              sizeconfig.dynamicScaleSize(size: 140, scaleFactorTablet: 1.2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColorLight.lightPrimaryVariant,
              border: Border.all()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: sizeconfig.dynamicScaleSize(
                      size: 200, scaleFactorTablet: 1.8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            title!,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColorLight.fontColorCards,
                                fontWeight: FontWeight.bold,
                                fontSize: sizeconfig.dynamicScaleSize(
                                    size: 15, scaleFactorTablet: 1.5)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            subtitle!,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColorLight.fontColorCards,
                                fontSize: sizeconfig.dynamicScaleSize(
                                    size: 12, scaleFactorTablet: 1.5)),
                          ),
                        ],
                      ),
                      Text(
                        horario!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColorLight.fontColorCards,
                          fontSize: sizeconfig.dynamicScaleSize(
                              size: 13, scaleFactorTablet: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        width: 130,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          top: 5.0,
                        ),
                        child: Center(
                          child: new Image.asset(
                            'lib/assets/images/youtube.png',
                            // width: 300.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Transmissão ao Vivo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColorLight.fontColorCards,
                            fontSize: sizeconfig.dynamicScaleSize(
                                size: 12, scaleFactorTablet: 1.6)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
