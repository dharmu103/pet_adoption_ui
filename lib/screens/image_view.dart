import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, this.pet});
  final pet;
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Hero(
          tag: pet["name"], child: CachedNetworkImage(imageUrl: pet["image"])),
    );
  }
}
