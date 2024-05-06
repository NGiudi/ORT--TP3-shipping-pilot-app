import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/travel_provider.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitButtonWidget extends ConsumerWidget {
  final int idx;

  const VisitButtonWidget({super.key, required this.idx});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Travel travel = ref.watch(travelProdiver)['travel'];
    final Visit visit = travel.visits[idx];

    switch (visit.status) {
      case Visit.NEW_STATUS:
        return ElevatedButton(
          onPressed: () async {
            ref.read(travelProdiver.notifier).startVisit(idx);
          },
          child: const Text('Iniciar visita'),
        );
      case Visit.IN_PROGRESS_STATUS:
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