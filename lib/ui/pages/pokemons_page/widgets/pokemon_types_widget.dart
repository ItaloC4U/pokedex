import 'package:flutter/material.dart';
import 'package:pokedex/utils/string_extensions.dart';

class PokemonTypesWidget extends StatelessWidget {
  const PokemonTypesWidget({super.key, required this.types});

  final List<String> types;

  Color _getTextColorBasedOnTypeColor(Color typeColor) {
    int d = 0;
    double luminance = (0.299 * typeColor.red +
            0.587 * typeColor.green +
            0.114 * typeColor.blue) /
        255;

    if (luminance > 0.5) {
      d = 0;
    } else {
      d = 255;
    }

    return Color.fromARGB(typeColor.alpha, d, d, d);
  }

  Color _getColorByType(String type) {
    switch (type) {
      case 'fire':
        return const Color(0xffEE8130);
      case 'water':
        return const Color(0xff6390F0);
      case 'electric':
        return const Color(0xffF7D02C);
      case 'grass':
        return const Color(0xff7AC74C);
      case 'ice':
        return const Color(0xff96D9D6);
      case 'fighting':
        return const Color(0xffC22E28);
      case 'poison':
        return const Color(0xffA33EA1);
      case 'ground':
        return const Color(0xffE2BF65);
      case 'flying':
        return const Color(0xffA98FF3);
      case 'psychic':
        return const Color(0xffF95587);
      case 'bug':
        return const Color(0xffA6B91A);
      case 'rock':
        return const Color(0xffB6A136);
      case 'ghost':
        return const Color(0xff735797);
      case 'dragon':
        return const Color(0xff6F35FC);
      case 'dark':
        return const Color(0xff705746);
      case 'steel':
        return const Color(0xffB7B7CE);
      case 'fairy':
        return const Color(0xffD685AD);

      case 'normal':
      default:
        return const Color(0xffA8A77A);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...types.map(
          (type) {
            final typeColor = _getColorByType(type);

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: typeColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                type.capitalize(),
                style: TextStyle(
                  color: _getTextColorBasedOnTypeColor(typeColor),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
