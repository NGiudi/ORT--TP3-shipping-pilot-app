import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitButtonWidget extends ConsumerWidget {
  final String travelId;
  final Visit visit;

  const VisitButtonWidget({
    super.key,
    required this.travelId,
    required this.visit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (visit.status) {
      case Visit.NEW_STATUS:
        return ElevatedButton(
          onPressed: () async {
            ref.read(travelProvider.notifier).startVisit(travelId, visit);
          },
          child: const Text('Iniciar visita'),
        );
      case Visit.IN_PROGRESS_STATUS:
        return ElevatedButton(
          onPressed: () async {
            context.push(
                '/visit_detail/${visit.id}/finalize?travelId=${visit.travelId}');
          },
          child: const Text('Finalizar visita'),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
