import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitButtonWidget extends StatelessWidget {
  final Visit visit;
  final int idx;

  const VisitButtonWidget({super.key, required this.idx, required this.visit});

  @override
  Widget build(BuildContext context) {
    
    switch (visit.status) {
      case 'new':
        return ElevatedButton(
          onPressed: () async {
            visit.status = 'in_progress';
            //TODO: agregar este update en riverpod.
            await VisitService.update(visit);
          },
          child: const Text('Iniciar visita'),
        );
      case 'in_progress':
        return ElevatedButton(
          onPressed: () async {
            context.push('/visit_detail/$idx/finalize');
          },
          child: const Text('Finalizar visita'),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}