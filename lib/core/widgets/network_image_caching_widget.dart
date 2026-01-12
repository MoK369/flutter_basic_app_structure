import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart'
    show
        StatelessWidget,
        BuildContext,
        Widget,
        CircularProgressIndicator,
        Icons,
        Icon;

class NetworkImageCachingWidget extends StatelessWidget {
  final String imageUrl;

  const NetworkImageCachingWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
