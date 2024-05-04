import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shipping_pilot/providers/travel_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/core/buisness_logic.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitFinalizePage extends ConsumerStatefulWidget {
  static const String name = 'VisitFinalize';

  final int idx;

  const VisitFinalizePage({super.key, required this.idx});

  @override
  VisitFinalizePageState createState() => VisitFinalizePageState();
}

class VisitFinalizePageState extends ConsumerState<VisitFinalizePage> {
  String _selected = Visit.SUCCESSFUL_STATUS;

  @override
  Widget build(BuildContext context) {
    final Settings settings = ref.watch(travelProdiver)['settings'];    
  
    final Travel travel = ref.watch(travelProdiver)['travel'];    
    final Visit visit = travel.visits[widget.idx];

    return ScrollableContentWithButtonLayoutPage(
      button: ElevatedButton(
        onPressed: () async {
          //? update visit data.
          visit.status = _selected;
          visit.price = BuisnessLogic.calculateVisitPrice(_selected, settings.pricing);

          //? update database information.
          ref.read(travelProdiver.notifier).updateVisit(visit);

          //?update page.
          context.goNamed(TravelDetailPage.name);
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
            }
          ),
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

