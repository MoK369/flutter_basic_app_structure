import 'package:cached_network_image_ce/cached_network_image.dart'
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
      errorBuilder: (context, object, stackTrace) => const Icon(Icons.error),
    );
  }
}
