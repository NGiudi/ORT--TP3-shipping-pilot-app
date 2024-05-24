import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/pages/travel/travel_detail/widgets/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

import 'package:shipping_pilot/models/index.dart';

class TravelDetailContent extends ConsumerWidget {
  static const String name = 'TravelDetail';

  final String travelId;

  const TravelDetailContent({super.key, required this.travelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TravelProviderModel tpm = ref.watch(travelProvider);
    List<Travel?> travels = tpm.travels;

    if (travels.isEmpty) {
      return TravelDetailEmptyStateWidget(travelId: travelId);
    }

    Travel? travel = travels.firstWhere((t) => t!.id == travelId);

    if (travel == null) {
      return TravelDetailEmptyStateWidget(travelId: travelId);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          TravelDetailWidget(travel: travel),
          const CustomDivider(),
          VehicleDetailWidget(vehicle: travel.vehicle),
          const CustomDivider(),
          const SectionTitleWidget(text: 'Visitas'),
          VisitsListWidget(travel: travel)
        ],
      ),
    );
  }
}
