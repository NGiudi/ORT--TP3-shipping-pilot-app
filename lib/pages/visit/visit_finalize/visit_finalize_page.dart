import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitFinalizePage extends ConsumerStatefulWidget {
  static const String name = 'VisitFinalize';

  final int travelIdx;
  final int visitIdx;

  const VisitFinalizePage({
    super.key,
    required this.visitIdx,
    this.travelIdx = 0
  });

  @override
  VisitFinalizePageState createState() => VisitFinalizePageState();
}

class VisitFinalizePageState extends ConsumerState<VisitFinalizePage> {
  String _selected = Visit.SUCCESSFUL_STATUS;

  @override
  Widget build(BuildContext context) {
    return ScrollableContentWithButtonLayoutPage(
      button: ElevatedButton(
        onPressed: () async {      
          ref.read(travelProvider.notifier).finalizeVisit(_selected, widget.visitIdx, widget.travelIdx);
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

