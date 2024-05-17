import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitButtonWidget extends ConsumerWidget {
  final int travelIdx;
  final int visitIdx;

  const VisitButtonWidget({
    super.key,
    this.travelIdx = 0,
    required this.visitIdx
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Travel?> travels = ref.watch(travelProvider)['travels'];

    final Visit visit = travels[travelIdx]!.visits[visitIdx];

    switch (visit.status) {
      case Visit.NEW_STATUS:
        return ElevatedButton(
          onPressed: () async {
            ref.read(travelProvider.notifier).startVisit(visitIdx, travelIdx);
          },
          child: const Text('Iniciar visita'),
        );
      case Visit.IN_PROGRESS_STATUS:
        return ElevatedButton(
          onPressed: () async {
            context.push('/visit_detail/$visitIdx/finalize');
          },
          child: const Text('Finalizar visita'),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}