import 'package:cached_network_image/cached_network_image.dart';
import 'package:church_app/assets/styles/colors.dart';
import 'package:church_app/src/widgets/load-circular-state.dart';
import 'package:flutter/material.dart';

class BeImageCached extends StatelessWidget {
  final String? url;
  final Widget? placeholder;
  final Widget? notFound;
  final double? radius;
  final double? sizeIcon;

  BeImageCached(
      {Key? key,
      @required this.url,
      this.notFound,
      this.placeholder,
      this.radius,
      this.sizeIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url!,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: radius != null
              ? BorderRadius.circular(radius!)
              : BorderRadius.circular(15),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => placeholder != null
          ? placeholder!
          : Container(child: loadCircularState()),
      errorWidget: (context, url, error) => notFound != null
          ? notFound!
          : Container(
              child: Icon(
              Icons.panorama_outlined,
              size: sizeIcon != null ? sizeIcon : 20,
              color: AppColorLight.greyColor.withOpacity(0.5),
            )),
    );
  }
}
