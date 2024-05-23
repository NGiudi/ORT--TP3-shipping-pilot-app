import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/services/api/travel_service.dart';

import 'package:shipping_pilot/models/index.dart';

class TravelCancelButton extends ConsumerWidget {
  final Travel travel;

  const TravelCancelButton({ super.key, required this.travel });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showCancelDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmar Cancelación'),
            content: const Text('¿Estás seguro de que quieres cancelar el recorrido?'),
            actions: [
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Sí'),
                onPressed: () {
                  travel.status = Travel.CANCELLED_STATUS;
                  
                  TravelService.update(travel);
                  ref.read(travelProvider.notifier).updateTravel();

                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          child: const Text('Cancelar recorrido'),
          onPressed: () => showCancelDialog(context),
        ),
      ),
    );
  }
}