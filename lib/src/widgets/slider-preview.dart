import 'package:carousel_slider/carousel_slider.dart';
import 'package:church_app/assets/styles/colors.dart';
import 'package:church_app/src/model/video-model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SliderPreview extends StatelessWidget {
  final List<CommonVideoModel> videosList;
  final bool destaque;
  SliderPreview(this.videosList, this.destaque);

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = videosList
        .map((item) => Container(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColorLight.blueColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    destaque
                        ? Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${item.titulo}',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${item.descricao}',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${item.titulo}',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text('${item.descricao}',
                                    maxLines: 3,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontSize: 12)),
                                SizedBox(height: 10),
                                Text(
                                  '${item.horaLive} ${DateFormat.yMMMMd('pt_BR').format(DateTime.parse(item.dataLive!))}',
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                    Container(
                        height: 115,
                        width: MediaQuery.of(context).size.width / 2.0,
                        // width: double.infinity,
                        padding: EdgeInsets.all(5),
                        child: GestureDetector(
                            onTap: () async {
                              item.isLive = true;
                              await Navigator.pushNamed(
                                  context, '/detalhesvideo',
                                  arguments: item);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(item.link!)}/0.jpg'),
                                      fit: BoxFit.fill)),
                            )))
                  ]),
                ))))
        .toList();

    return Container(
        child: Column(children: <Widget>[
      CarouselSlider(
        options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            height: 140),
        items: imageSliders,
      ),
    ]));
  }
}
