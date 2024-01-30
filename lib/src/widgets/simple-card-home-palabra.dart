import 'package:church_app/assets/styles/colors.dart';
import 'package:church_app/helpers/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SimpleCardhomePalabra extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? horario;
  final VoidCallback? onTap;
  final String? button;
  SimpleCardhomePalabra(
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
          height: sizeconfig.dynamicScaleSize(size: 140),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColorLight.lightPrimaryVariant,
              border: Border.all(
                  // color: Colors.blue
                  )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: sizeconfig.dynamicScaleSize(size: 150),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Palavra do Pastor \n',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                  color: AppColorLight.fontColorCards,
                                  fontWeight: FontWeight.bold,
                                  fontSize: sizeconfig.dynamicScaleSize(
                                      size: 16, scaleFactorTablet: 1.5)),
                            ),
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
                        )
                      ]),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: sizeconfig.dynamicScaleSize(size: 120),
                            width: MediaQuery.of(context).size.width / 2.1,
                            padding: EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: onTap,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(horario!)}/0.jpg'),
                                        // image: NetworkImage('${horario}'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              child: Icon(Icons.play_arrow_rounded,
                                  size: 60,
                                  color: AppColorLight.iconesAnexoColor),
                            ),
                          )
                        ],
                      )
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
