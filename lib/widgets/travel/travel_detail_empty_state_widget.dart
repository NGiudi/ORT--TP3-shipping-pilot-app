import 'package:flutter/material.dart';

import 'package:shipping_pilot/widgets/index.dart';

class TravelDetailEmptyStateWidget extends StatelessWidget {
  final String? travelId;

  const TravelDetailEmptyStateWidget({super.key, this.travelId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MessageWidget(
        icon: const Icon(
          Icons.warning,
          size: 80,
          color: Colors.orange,
        ),
        title: 'Nada por aquí',
        text: travelId == null
            ? 'Se debe ingresar el id del recorrido.'
            : 'No se encontró ningún recorrido con el id $travelId.',
      ),
    );
  }
}
