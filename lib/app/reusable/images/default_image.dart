import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../core/assets.dart';
import '../../core/constant.dart';
import '../reusable.dart';

class DefaultImage extends StatelessWidget {
  final EdgeInsets margin;
  final double? width;
  final double? height;
  final String? imageUrl;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final BlendMode? blendMode;
  final String? placeholderAsset;
  final Alignment alignment;

  const DefaultImage(
    this.imageUrl, {
    Key? key,
    this.margin = EdgeInsets.zero,
    this.width = double.infinity,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.color,
    this.blendMode,
    this.placeholderAsset,
    this.alignment = Alignment.center,
  }) : super(key: key);

//============================================================
// ** Properties **
//============================================================

//============================================================
// ** Flutter Build Cycle **
//============================================================

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: _getImageType(),
      ),
    );
  }

//============================================================
// ** Widgets **
//============================================================

  Widget _networkImage() {
    return CachedNetworkImage(
      alignment: alignment,
      color: color,
      colorBlendMode: blendMode,
      width: width,
      height: height,
      imageUrl: imageUrl!,
      fit: fit,
      placeholder: (context, _) => const SimmerLoader(),
      errorWidget: (context, url, error) => _placeholderImage(),
    );
  }

  Widget _placeholderImage() {
    return Image.asset(
      placeholderAsset!,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: blendMode,
      alignment: alignment,
    );
  }

  Widget _assetImage() {
    return Image.asset(
      imageUrl ?? emptyString,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: blendMode,
      alignment: alignment,
    );
  }

  Widget _svgAssetImage() {
    return SvgPicture.asset(
      imageUrl ?? emptyString,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
    );
  }

  Widget _lottieAssetImage() {
    return Lottie.asset(
      imageUrl ?? emptyString,
      width: width,
      height: height,
      alignment: alignment,
      fit: fit,
    );
  }

  Widget _svgNetworkImage() {
    return SvgPicture.network(
      imageUrl ?? emptyString,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
    );
  }

  Widget _fileImage() {
    return Image.file(
      File(imageUrl ?? emptyString),
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: blendMode,
      alignment: alignment,
    );
  }

//============================================================
// ** Helper Functions **
//============================================================

  Widget _getImageType() {
    if (imageUrl!.startsWith('assets') && imageUrl!.endsWith('svg')) {
      return _svgAssetImage();
    }
    if (imageUrl!.startsWith('http') && imageUrl!.endsWith('svg')) {
      return _svgNetworkImage();
    }
    if (imageUrl!.startsWith('assets') && imageUrl!.endsWith('json')) {
      return _lottieAssetImage();
    }
    if (imageUrl == null || imageUrl == emptyString) {
      return _placeholderImage();
    }

    if (imageUrl!.startsWith('http')) {
      return _networkImage();
    }

    if (imageUrl!.startsWith('assets')) {
      return _assetImage();
    }

    return _fileImage();
  }
}

class NetWorkImage extends StatelessWidget {
  final Color? color;
  final BlendMode? blendMode;
  final double? width;
  final double? height;
  final String imageUrl;
  final BoxFit? fit;
  final Key? key;
  final GlobalKey _backgroundImageKey = GlobalKey();
  NetWorkImage(this.imageUrl,
      {this.color,
      this.blendMode,
      this.width,
      this.height,
      this.fit,
      this.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: key,
      color: color,
      colorBlendMode: blendMode,
      width: width,
      height: height,
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, _) => const SimmerLoader(),
      errorWidget: (context, url, error) => _placeholderImage(),
    );
  }

  Widget _placeholderImage() {
    return Image.asset(
      AppIcon.placeholder,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      color: color,
      colorBlendMode: blendMode,
    );
  }
}
