import 'dart:io';

import 'package:church_app/assets/styles/colors.dart';
import 'package:church_app/src/widgets/be-cached-image.dart';
import 'package:flutter/material.dart';

class AvatarProfileWidget extends StatelessWidget {
  final String? urlImage;
  final File? fileSelected;
  final VoidCallback? onTap;
  final double radius;
  final double sizeIcon;
  const AvatarProfileWidget(
      {Key? key,
      this.urlImage,
      this.sizeIcon = 100,
      this.radius = 10,
      this.fileSelected,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onTap == null
        ? Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                color: AppColorLight.cardVideoColorSecundary,
                borderRadius: BorderRadius.circular(radius),
                image: fileSelected != null
                    ? DecorationImage(
                        fit: BoxFit.fill,
                        image: FileImage(File('${fileSelected?.path}')))
                    : null),
            child: fileSelected != null
                ? Container()
                : BeImageCached(
                    radius: radius,
                    sizeIcon: 40,
                    notFound: Icon(Icons.person,
                        color: AppColorLight.cardVideoColor, size: sizeIcon),
                    url: urlImage!,
                  ))
        : Stack(
            children: [
              Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: AppColorLight.cardVideoColorSecundary,
                      borderRadius: BorderRadius.circular(radius),
                      image: fileSelected != null
                          ? DecorationImage(
                              fit: BoxFit.fill,
                              image: FileImage(File('${fileSelected?.path}')))
                          : null),
                  child: fileSelected != null
                      ? Container()
                      : BeImageCached(
                          radius: 10,
                          sizeIcon: 40,
                          notFound: Icon(Icons.person,
                              color: AppColorLight.cardVideoColor, size: 100),
                          url: urlImage!,
                        )),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: IconButton(
                    onPressed: onTap,
                    icon: Icon(Icons.camera_alt,
                        color: Theme.of(context).primaryColor)),
              )
            ],
          );
  }
}
