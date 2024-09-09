import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonImageWidget extends StatelessWidget {
  const PokemonImageWidget({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl?.isEmpty == true) {
      return const SizedBox.shrink();
    }

    final imageIsSvg = imageUrl!.endsWith('.svg');

    if (imageIsSvg) {
      return SvgPicture.network(
        imageUrl!,
        fit: BoxFit.scaleDown,
        height: 100,
      );
    }

    return Image.network(
      imageUrl!,
      fit: BoxFit.scaleDown,
      height: 100,
    );
  }
}
