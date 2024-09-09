import 'package:flutter/material.dart';
import 'package:pokedex/main/routes/app_routes.dart';
import 'package:pokedex/protocols/ipokemon_controller.dart';
import 'package:pokedex/theme/theme.dart';
import 'package:pokedex/ui/controllers/pokemon_controller.dart';
import 'package:pokedex/utils/inject_util.dart';
import 'package:pokedex/utils/toast_util.dart';

void main() {
  Inject.registerSingleton<IToastUtil>(ToastUtil());
  Inject.registerSingleton<IPokemonController>(
    PokemonController(
      toastUtil: Inject.get(),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: routes,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple.shade600,
        ),
        textTheme: textTheme,
        primaryTextTheme: textTheme,
        scaffoldBackgroundColor: Colors.deepPurple.shade50,
        appBarTheme: const AppBarTheme(
          elevation: 2,
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(2),
            backgroundColor: WidgetStateProperty.all(
              Colors.deepPurple.shade600,
            ),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
