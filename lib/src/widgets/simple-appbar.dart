import 'package:flutter/material.dart';
//import 'package:church_app/assets/styles/colors.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  SimpleAppBar({
    Key? key,
    this.leadingIcon,
    this.actionIcon,
    this.title = '',
    this.scaffoldKey,
    this.actionsList,
    this.onLeadingPressed,
    this.sizeActionIcon = 30,
    this.sizeLeadingIcon = 20,
    this.centerTitle = false,
    this.showLeading = true,
    this.bgcolor,
  }) : super(key: key);

  final IconData? leadingIcon;
  final IconData? actionIcon;
  final List<Widget>? actionsList;
  final VoidCallback? onLeadingPressed;
  final double sizeActionIcon;
  final double sizeLeadingIcon;
  final bool centerTitle;
  final String title;
  final bool showLeading;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Size appBarHeight = Size.fromHeight(56.0);
  final Color? bgcolor;

  @override
  Size get preferredSize => appBarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        centerTitle: centerTitle,
        // brightness: bgcolor != null ? Brightness.dark : Brightness.light,
        backgroundColor:
            bgcolor != null ? bgcolor : Theme.of(context).colorScheme.primary,
        leadingWidth: 100,
        leading: showLeading
            ? Container(
                padding: EdgeInsets.only(left: 10),
                child: TextButton(
                  onPressed: onLeadingPressed,
                  child: Row(children: [
                    Icon(Icons.arrow_back_ios,
                        color: Theme.of(context).colorScheme.onSurface),
                    Text('Voltar',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface))
                  ]),
                ),
              )
            : Container(),
        title: Text(
          title,
          textScaleFactor: 1.0,
          style: TextStyle(
            color: bgcolor != null
                ? bgcolor
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
        actions: actionsList);
  }
}
