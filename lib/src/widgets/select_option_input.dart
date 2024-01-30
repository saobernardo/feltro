import 'dart:io';
import 'package:church_app/assets/styles/colors.dart';
import 'package:church_app/src/widgets/load-circular-state.dart';
import 'package:flutter/material.dart';

class SelectOptionInput extends StatefulWidget {
  final String? title;
  final Future<Function>? onTap;
  final bool isRequired;
  final String? initialValue;
  final Function(dynamic value)? onSelected;
  final List<DropItem>? items;
  const SelectOptionInput(
      {Key? key,
      this.isRequired = false,
      this.initialValue,
      this.onTap,
      @required this.title,
      this.items,
      this.onSelected})
      : super(key: key);

  @override
  _SelectOptionInputState createState() => _SelectOptionInputState();
}

class _SelectOptionInputState extends State<SelectOptionInput> {
  bool isLoading = false;
  String valueSelected = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      valueSelected = widget.initialValue != null ? widget.initialValue! : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
        child: Column(children: [
          textTitle(widget.title!),
          SizedBox(height: 4),
          GestureDetector(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });

                await widget.onTap;

                if (isLoading) {
                  modalBottomSheetOptions(context, widget.title);
                }
                setState(() {
                  isLoading = false;
                });
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                      color: AppColorLight.backgroundSelectFieldColor,
                      border: Border.all(
                          width: 2,
                          color:
                              valueSelected == '' && widget.isRequired == true
                                  ? AppColorLight.redAccentColor
                                  : AppColorLight.cardVideoColor),
                      borderRadius: new BorderRadius.circular(5)),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                      height: 45,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              '${valueSelected != '' ? valueSelected : '-'}',
                              style: TextStyle(
                                color: AppColorLight.fontSelectedIndexColor,
                                fontSize: 16,
                              ),
                            )),
                            isLoading
                                ? Container(
                                    width: 20,
                                    height: 20,
                                    child: loadCircularState(
                                        context: context, colwhite: false),
                                  )
                                : Container(
                                    child: Icon(
                                      Icons.arrow_drop_down_circle,
                                      color:
                                          AppColorLight.downCircledArrowColor,
                                    ),
                                  )
                          ]))))
        ]));
  }

  Widget textTitle(String title) {
    return Container(
        width: double.infinity,
        child: Text(
          '$title',
          textScaleFactor: 1.0,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 15,
          ),
        ));
  }

  modalBottomSheetOptions(context, title) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(
              color: AppColorLight.pureWhite,
            ),
            child: Container(
              height: Platform.isIOS ? 355 : 300,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          '$title',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColorLight.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 259,
                      child: ListView.builder(
                        itemCount: widget.items!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  widget
                                      .onSelected!(widget.items?[index].value);
                                  valueSelected = widget.items![index].label;
                                });
                              },
                              child: Container(
                                child: ListTile(
                                  trailing: widget.items?[index].label ==
                                          valueSelected
                                      ? CircleAvatar(
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          child: Icon(
                                            Icons.done,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                        )
                                      : Container(
                                          child: Text(''),
                                        ),
                                  title: Text(
                                    widget.items![index].label,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: AppColorLight.blackColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ));
                        },
                      )),
                ],
              ),
            ));
      },
    );
  }
}

class DropItem {
  final String label;
  final dynamic value;
  DropItem(this.label, this.value);
}
