import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/pages/travel/travel_detail/widgets/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

import 'package:shipping_pilot/models/index.dart';

class TravelDetailContent extends ConsumerWidget {
  static const String name = 'TravelDetail';

  final int travelIdx;

  const TravelDetailContent({ super.key, this.travelIdx = 0 });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Travel?> travels = ref.watch(travelProvider)['travels'];
    
    if (travels.isEmpty) {
      return const MessageWidget(
        icon: Icon(
          Icons.warning,
          size: 80,
          color: Colors.orange,
        ),
        title: 'No hay recorrido asignado',
        text: 'No se encontró ningún recorrido asignado para tu usuario.',
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), 
      child: ListView(
        children: [
          TravelDetailWidget(travel: travels[travelIdx]!),
          const CustomDivider(),
          VehicleDetailWidget(vehicle: travels[travelIdx]!.vehicle),
          const CustomDivider(),
          const  SectionTitleWidget(text: 'Visitas'),
          VisitsListWidget(travel: travels[travelIdx]!)
        ],
      ),
    );
  }
}