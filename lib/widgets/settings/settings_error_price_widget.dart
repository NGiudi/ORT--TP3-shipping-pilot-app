import 'package:flutter/material.dart';
import 'package:shipping_pilot/widgets/layout/message_widget.dart';

class SettingsErrorPriceWidget extends StatelessWidget {
  const SettingsErrorPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MessageWidget(
        icon: Icon(
          Icons.warning,
          size: 80,
          color: Colors.orange,
        ),
        title: 'Nada por aquí',
        text: 'No se pudo acceder a los datos del precio',
      ),
    );
  }
}
