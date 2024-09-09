import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/presentation/protocols/iuser_store.dart';
import 'package:pokedex/presentation/ui/widgets/default_app_bar_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.userStore,
  });

  final IUserStore userStore;

  void handleLogin(BuildContext ctx) {
    userStore.fetchUser();
    ctx.push('/pokemons');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBarWidget(title: 'PokeDex'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Login Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => handleLogin(context),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
