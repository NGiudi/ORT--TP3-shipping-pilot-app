import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shipping_pilot/pages/common/scrollable_content_with_button_layout_page.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitFinalizePage extends StatefulWidget {
  static const String name = 'VisitFinalize';

  final int idx;

  const VisitFinalizePage({super.key, required this.idx});

  @override
  State<VisitFinalizePage> createState() => _VisitFinalizePageState();
}

class _VisitFinalizePageState extends State<VisitFinalizePage> {
  String _selected = 'successful';

  @override
  Widget build(BuildContext context) {
    final travelsService = Provider.of<TravelsService>(context);
    
    final Travel? travel = travelsService.travel;
    final Visit visit = travel!.visits[widget.idx];

    return ScrollableContentWithButtonLayoutPage(
      button: ElevatedButton(
        onPressed: () async {
          visit.status = _selected;
          await VisitsService().updateVisit(visit);
        },
        child: const Text('Guardar'),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile(
            title: const Text('Exitosa'),
            value: 'successful',
            groupValue: _selected,
            onChanged: (value) {
              setState(() {
                _selected = value!;
              });
            }
          ),
          RadioListTile(
            title: const Text('Fallida'),
            value: 'failed',
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

