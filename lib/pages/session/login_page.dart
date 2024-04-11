import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shipping_pilot/pages/pages.dart';

class LoginPage extends StatefulWidget {
  static const String name = 'LoginPage';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usuarioController = TextEditingController();

  final TextEditingController _claveController = TextEditingController();

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              controller: _usuarioController,
              decoration: InputDecoration(
                hintText: 'Usuario',
                labelText: 'Usuario',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              obscureText: passwordVisible,
              controller: _claveController,
              decoration: InputDecoration(
                hintText: 'Clave',
                labelText: 'Clave',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(
                      () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_usuarioController.text.isEmpty ||
                  _claveController.text.isEmpty) {
                return;
              }
              GoRouter.of(context).pushNamed(TravelDetailPage.name,
                  extra: _usuarioController.text);
            },
            child: const Text('Iniciar sesion'),
          ),
        ],
      ),
    );
  }
}