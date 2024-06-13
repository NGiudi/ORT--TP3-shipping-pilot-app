import 'package:flutter/material.dart';
import 'package:shipping_pilot/widgets/layout/message_widget.dart';

class TravelDetailUserErrorWidget extends StatelessWidget {
  const TravelDetailUserErrorWidget({super.key});

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
        text: 'No existe un usuario logueado',
      ),
    );
  }
}
