import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';

class CartItemProfile extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData? icons;
  CartItemProfile({this.title = "", this.subtitle = "", this.icons});
  @override
  _CartItemProfileState createState() => _CartItemProfileState();
}

class _CartItemProfileState extends State<CartItemProfile> {
  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var witeColor = AppColorLight.pureWhite;
    var subColor = AppColorLight.greyColor;

    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            color: witeColor, borderRadius: BorderRadius.circular(7)),
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: witeColor,
              child: Icon(
                widget.icons,
                color: primaryColor,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                    onTap: () async {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // child: Text('Informaçōes pessoais',
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: primaryColor),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          // child: Text('Nome, Sobrenome, Sexo etc...',
                          child: Text(
                            widget.subtitle,
                            style: TextStyle(color: subColor),
                          ),
                        )
                      ],
                    ))),
            Container(
              child: Icon(
                Icons.navigate_next_rounded,
                size: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
