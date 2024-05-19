import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitFinalizePage extends ConsumerStatefulWidget {
  static const String name = 'VisitFinalize';

  final String? travelId;
  final String visitId;

  const VisitFinalizePage({
    super.key,
    this.travelId,
    required this.visitId,
  });

  @override
  VisitFinalizePageState createState() => VisitFinalizePageState();
}

class VisitFinalizePageState extends ConsumerState<VisitFinalizePage> {
  String _selected = Visit.SUCCESSFUL_STATUS;

  @override
  Widget build(BuildContext context) {
    final List<Travel?> travels = ref.watch(travelProvider)['travels'];

    if (travels.isEmpty || widget.travelId == null) {
      return TravelDetailEmptyStateWidget(travelId: widget.travelId);
    }

    Travel? travel = travels.firstWhere((t) => t!.id == widget.travelId);

    if (travel == null) {
      return TravelDetailEmptyStateWidget(travelId: widget.travelId);
    }

    final Visit visit = travel.visits.firstWhere((v) => v.id == widget.visitId);

    return ScrollableContentWithButtonLayoutPage(
      button: ElevatedButton(
        onPressed: () async {
          ref
              .read(travelProvider.notifier)
              .finalizeVisit(widget.travelId!, _selected, visit);
          context.go('/travel_detail/${widget.travelId}');
        },
        child: const Text('Guardar'),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile(
              title: const Text('Exitosa'),
              value: Visit.SUCCESSFUL_STATUS,
              groupValue: _selected,
              onChanged: (value) {
                setState(() {
                  _selected = value!;
                });
              }),
          RadioListTile(
            title: const Text('Fallida'),
            value: Visit.FAILED_STATUS,
            groupValue: _selected,
            onChanged: (value) {
              setState(() {
                _selected = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
