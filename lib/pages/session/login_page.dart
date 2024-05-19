import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/models/index.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const String name = 'LoginPage';

  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  bool passwordVisible = true;

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _claveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void showErrorSnackbar() {
      SnackBar snackbar = SnackBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        content: const Text('El usuario ingresado es inválido.'),
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usuarioController,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              obscureText: passwordVisible,
              controller: _claveController,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: IconButton(
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_usuarioController.text.isEmpty ||
                      _claveController.text.isEmpty) {
                    return;
                  }

                  int docNumber = int.parse(_usuarioController.text);

                  User? user =
                      await ref.read(userProvider.notifier).login(docNumber);

                  if (user != null) {
                    if (user.isAdmin()) {
                      ref.read(travelProvider.notifier).getTravels();
                      context.goNamed(TravelListPage.name);
                    } else {
                      String travelId = '${user.docNumber}-24042024';

                      ref
                          .read(travelProvider.notifier)
                          .getDriverTravel(travelId);
                      context.go('/travel_detail/$travelId');
                    }
                  } else {
                    showErrorSnackbar();
                  }
                },
                child: const Text('Iniciar sesión'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
