import 'package:church_app/assets/styles/colors.dart';
import 'package:flutter/material.dart';

class CardSelected extends StatefulWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final String title;
  final bool selected;
  final Color? carColor;

  CardSelected(
      {this.onTap,
      this.icon,
      this.title = "",
      this.selected = false,
      this.carColor});

  @override
  _CardSelectedState createState() => _CardSelectedState();
}

class _CardSelectedState extends State<CardSelected> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          height: 60,
          padding: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: widget.selected
                  ? AppColorLight.cardSelectedColorBoxColor
                  : null,
              border: Border.all(
                  color: widget.carColor != null
                      ? widget.carColor!
                      : Theme.of(context).primaryColor)),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          // CustomIcons.avatar,
                          widget.icon,
                          color: widget.carColor != null
                              ? widget.carColor
                              : Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        child: Container(
                            padding: EdgeInsets.only(left: 10, right: 20),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                  fontSize: 17,
                                  // color: Theme.of(context).primaryColor,
                                  color: widget.carColor != null
                                      ? widget.carColor
                                      : Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  )),
              Container(
                  child: widget.selected
                      ? Container(
                          child: Icon(Icons.check_circle_sharp,
                              size: 30, color: AppColorLight.greenColor))
                      : Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: widget.carColor != null
                                    ? widget.carColor!
                                    : Theme.of(context).primaryColor,
                              )),
                        ))
            ],
          )),
    );
  }
}
