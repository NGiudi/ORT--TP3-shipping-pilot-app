import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/pages/session/loogin/widgets/ocult_password_icon_widget.dart';
import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/utils/index.dart';

import 'package:shipping_pilot/models/index.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const String name = 'LoginPage';

  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  bool passwordVisible = true;

  final formKey = GlobalKey<FormState>();

  final TextEditingController docNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: docNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'DNI',
                  labelText: 'DNI',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (String? value) {
                  return docNumberFormValidation(value);
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Contraseña',
                  labelText: 'Contraseña',
                  suffixIcon: OcultPasswordIconWidget(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    visible: passwordVisible,
                  ),
                ),
                obscureText: passwordVisible,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      int docNumber = int.parse(docNumberController.text);

                      User? user = await ref.read(userProvider.notifier).login(docNumber);

                      if (user != null) {
                        if (user.isAdmin()) {
                          ref.read(travelProvider.notifier).getTravels();
                          context.goNamed(TravelListPage.name);
                        } else {
                          String travelId = '${user.docNumber}-24042024';

                          ref.read(travelProvider.notifier).getDriverTravel(travelId);

                          context.go('/travel_detail/$travelId');
                        }
                      } else {
                        CustomSnackbar.showErrorSnackbar(context, 'El usuario ingresado es inválido.');
                      }
                    }
                  },
                  child: const Text('Iniciar sesión'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
