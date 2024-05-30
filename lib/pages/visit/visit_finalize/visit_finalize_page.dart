import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/utils/index.dart';

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

  final formKey = GlobalKey<FormState>();
  final TextEditingController docNumberController = TextEditingController();
  final TextEditingController failedReasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TravelProviderModel tpm = ref.watch(travelProvider);
    final List<Travel> travels = tpm.travels; 

    if (travels.isEmpty || widget.travelId == null) {
      return TravelDetailEmptyStateWidget(travelId: widget.travelId);
    }

    Travel? travel = travels.firstWhere((t) => t.id == widget.travelId);

    final Visit visit = travel.visits.firstWhere((v) => v.id == widget.visitId);

    return Form(
      key: formKey,
      child: ScrollableContentWithButtonLayoutPage(
        button: ElevatedButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              UserProviderModel upm = ref.watch(userProvider);
              Pricing pricing = upm.settings!.pricing;
              
              visit.status = _selected;
              visit.price = calculateVisitPrice(pricing, _selected);
              
              if (_selected == Visit.FAILED_STATUS) {
                visit.deliveryRecord.docNumber = "";
                visit.deliveryRecord.failedReason = failedReasonController.text;
              } else if (_selected == Visit.SUCCESSFUL_STATUS) {
                visit.deliveryRecord.docNumber = docNumberController.text;
                visit.deliveryRecord.failedReason = "";
              }
        
              ref.read(travelProvider.notifier).finalizeVisit(widget.travelId!, visit);
              context.go('/travel_detail/${widget.travelId}');
            }
          },
          child: const Text('Guardar'),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8, left: 8, top: 8.0),
              child: TextWidget(text: "Finalizar visita como:"),
            ),
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
            const CustomDivider(),
            const Padding(
              padding: EdgeInsets.only(bottom: 8, left: 8, top: 8.0),
              child: TextWidget(text: "Para terminar con el proceso se debe completar los siguientes campos:"),
            ),
            Visibility(
              visible: _selected == Visit.SUCCESSFUL_STATUS, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: docNumberController,
                  decoration: const InputDecoration(
                    labelText: 'DNI del recptor',
                  ),
                  validator: (String? value) {
                    return textFormValidation(value);
                  },
                ),
              ),
            ),
            Visibility(
              visible: _selected == Visit.FAILED_STATUS,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: failedReasonController,
                  decoration: const InputDecoration(
                    labelText: 'Razón de visita fallida',
                  ),
                  validator: (String? value) {
                    return textFormValidation(value);
                  },
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
