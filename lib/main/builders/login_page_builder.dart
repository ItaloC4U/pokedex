import 'package:flutter/material.dart';
import 'package:pokedex/ui/pages/login_page/login_page.dart';
import 'package:pokedex/ui/services/stores/user_store.dart';

class LoginPageBuilder extends StatefulWidget {
  const LoginPageBuilder({super.key});

  @override
  State<LoginPageBuilder> createState() => _LoginPageBuilderState();
}

class _LoginPageBuilderState extends State<LoginPageBuilder> {
  @override
  Widget build(BuildContext context) {
    return LoginPage(
      userStore: UserStore(),
    );
  }
}
