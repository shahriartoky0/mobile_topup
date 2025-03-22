import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final Widget? errorWidget;

  const CachedImage({
    required this.imageUrl,
    this.width = 50.0, // Default width is 50.0
    this.height = 50.0, // Default height is 50.0
    this.fit = BoxFit.cover, // Default fit is BoxFit.cover
    this.errorWidget = const Icon(Icons.error), // Default error widget
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => errorWidget ?? const Icon(Icons.error),
    );
  }
}
