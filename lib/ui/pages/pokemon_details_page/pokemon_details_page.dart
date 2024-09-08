import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({super.key, this.id});

  final String? id;

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  void initState() {
    super.initState();

    if (widget.id == null) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
