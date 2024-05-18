import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shipping_pilot/pages/index.dart';

class LogoutAlertWidget extends StatelessWidget{
  const LogoutAlertWidget({ super.key });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('¿Deseas cerrar sesión?'),
      content: const Text(
        'Salir de tu cuenta te desconectará y necesitarás volver a iniciar sesión para acceder a tus datos y servicios.'),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('Cancelar')),
        FilledButton(
          onPressed: () {
            context.pop();
            context.goNamed(LoginPage.name);
          },
          child: const Text('Salir')),
      ],
    );
  }
}
