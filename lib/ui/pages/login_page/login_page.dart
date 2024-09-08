import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/protocols/iuser_store.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.userStore,
  });

  final IUserStore userStore;

  void handleLogin(BuildContext ctx) {
    userStore.fetchUser();
    ctx.go('/pokemons');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokeDex'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Login Page'),
            ElevatedButton(
              onPressed: () => handleLogin(context),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
