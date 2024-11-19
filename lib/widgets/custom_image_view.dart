import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 


/// Extension to determine the image type based on the URL.
extension ImageTypeExtension on String {
  ImageType get imageType {
    if (this.startsWith('http') || this.startsWith('https')) {
      return ImageType.network;
    } else if (this.endsWith('.svg')) {
      return ImageType.svg;
    } else if (this.startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

/// Enum   representing different image types.
enum ImageType { svg, png, network, file, unknown }

/// Custom image view widget with various customization options.
class CustomImageView extends StatelessWidget {
  // Required parameter for showing image
  final String imagePath;

  // Optional parameters
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final Border? border;
  final String? placeholder;

  CustomImageView({
    required this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.margin,
    this.radius,
    this.border,
    this.placeholder = 'assets/images/image_not_found.png',
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: buildWidget())
        : buildWidget();
  }

  Widget buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: buildCircleImage(), 

      ),
    );
  }

  // Builds the image with border radius
  Widget buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius!,
        child: buildImageWithBorder(),
      );
    } else {
      return buildImageWithBorder();

    }
  }

  // Builds the actual image based on the image type
  Widget buildImageWithBorder() {
  if (border != null) {
    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: radius,
      ),
      child: buildImageView(),
    );
  } else {
    return buildImageView();
  }
}

Widget buildImageView() {
  if(imagePath != null) {
    switch (imagePath!.imageType) {
      case ImageType.svg:
        return Container(
          height: height,
          width: width,
          child: SvgPicture.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            colorFilter: 
 this.color != null
                ? ColorFilter.mode(
                    this.color ?? Colors.transparent, BlendMode.srcIn)
                : null,
          ),
        );
      case ImageType.file:
        return Image.file(
          File(imagePath!),
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color,
        );
      case ImageType.network:
        return CachedNetworkImage(
          height: height,
          width: width,
          fit: fit,
          imageUrl: imagePath!,
          color: color,
          placeholder: (context, url) => Container(
            height: 30,
            width: 30,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey.shade100,
              color: Colors.grey.shade200,
            ),
          ),
          errorWidget: (context, url, error) => Image.asset(
            "$placeholder",
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
          ),
        );
      case ImageType.png:
      default:
        return Image.asset( 
          imagePath!,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color, 

        );
    }
  } else {
    return SizedBox();
  }
}
}