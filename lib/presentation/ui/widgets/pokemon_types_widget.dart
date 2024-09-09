import 'package:flutter/material.dart';
import 'package:pokedex/domain/data/iget_pokemons_data.dart';
import 'package:pokedex/utils/string_extensions.dart';

class PokemonTypesWidget extends StatelessWidget {
  const PokemonTypesWidget({super.key, required this.types});

  final List<PokemonTypeModel> types;

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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...types.map(
          (type) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: type.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                type.name.capitalize(),
                style: TextStyle(
                  color: _getTextColorBasedOnTypeColor(type.color),
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
