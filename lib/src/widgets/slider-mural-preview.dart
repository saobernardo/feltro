// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:church_app/src/model/mural-model.dart';
// import 'package:flutter/material.dart';


// class SliderMuralPreview extends StatelessWidget {
//   final List<MuralModel> muralList;
//   SliderMuralPreview(this.muralList);

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> imageSliders = muralList.map((item) => Container(
//       child: Container(
//         // decoration: BoxDecoration(
//         //   borderRadius: BorderRadius.circular(10),
//         //   color: Colors.blue
//         //   // color: Theme.of(context).colorScheme.secondary
//         // ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Color(0xff102A3B),
//           border: Border.all(
//             // color: Colors.blue
//           )
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Text('${item.titulo}', 
//                   maxLines: 4,
//                   textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.background,
//                       // fontWeight: FontWeight.bold,
//                       fontSize: 15
//                     ),
//                   )
//               ),
//               Container(
//                 height: 115,
//                 width: MediaQuery.of(context).size.width/2.0,
//                 // width: double.infinity,
//                 padding: EdgeInsets.all(5),
//                 child: GestureDetector(
//                   onTap: ()async{
//                     await Navigator.pushNamed(context, '/detalhesvideo', arguments: item);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       image: DecorationImage(
//                         image: NetworkImage('${item.foto}'),
//                         fit: BoxFit.fill
//                       )
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )
//       )
//       // child: Container(
//       //     child: ClipRRect(
//       //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
//       //       child: BeImageCached(url: item.link)
//       //       // (imageUrl: item, compleImages: true, circleImg: false),
//       //     )
//       //   )
//       )
//     ).toList();

//     return Container(
//       child: Column(
//         children: <Widget>[
//           CarouselSlider(
//             options: CarouselOptions(
//               autoPlay: true,
//               aspectRatio: 2.0,
//               enlargeCenterPage: true,
//               height: 140
//             ),
//             items: imageSliders,
//           ),
//         ]
//       )
//     );
//   }
// }