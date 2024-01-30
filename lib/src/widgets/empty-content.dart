import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:church_app/assets/styles/colors.dart';

Widget emptyContent({@required msg, String? assetSvg, double? size}) {
  return Container(
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: SvgPicture.asset(
                  '${assetSvg != null ? assetSvg : 'lib/assets/images/undraw_No_data_re_kwbl.svg'}',
                  width: size != null ? size : 260,
                ),
              ),
            ),
            Container(
              width: 310,
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                '$msg',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: AppColorLight.unselectedTabColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ));
}
