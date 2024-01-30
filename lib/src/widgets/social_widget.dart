//import 'package:church_app/helpers/social-ic.dart';
import 'package:flutter/material.dart';
import 'package:church_app/assets/styles/colors.dart';

class SocialWidget extends StatefulWidget {
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? color;

  SocialWidget({Key? key, this.icon, this.onTap, this.color}) : super(key: key);

  @override
  _SocialWidgetState createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Container(
        margin: EdgeInsets.only(left: 8.0),
        alignment: Alignment.center,
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new GestureDetector(
                onTap: widget.onTap,
                child: new Container(
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(6.0),
                    color: widget.color,
                  ),
                  height: 48,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          padding: EdgeInsets.only(
                            top: 14.0,
                            bottom: 14.0,
                          ),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                widget.icon,
                                color: AppColorLight.pureWhite,
                                size: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
