import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shipping_pilot/pages/pages.dart';

class LoginPage extends StatelessWidget {
  static const String name = 'LoginPage';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text("Iniciar sesión"),
          onPressed: () {
            GoRouter.of(context).pushNamed(TravelDetailPage.name);
          },
        ),
      ),
    );
  }
}