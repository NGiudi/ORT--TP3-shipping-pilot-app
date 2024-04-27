import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shipping_pilot/widgets/widgets.dart';

import 'package:shipping_pilot/services/services.dart';

import 'package:shipping_pilot/models/models.dart';

class TravelDetailContent extends StatelessWidget {
  static const String name = 'TravelDetail';

  const TravelDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    final travelsService = Provider.of<TravelsService>(context);

    final Travel? travel = travelsService.travel;
    
    if (travel == null) {
      return const EmptyStateWidget();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TravelDetailWidget(travel: travel),
        VehicleDetailWidget(vehicle: travel.vehicle),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 24),
          child: Text('Visitas', style: Theme.of(context).textTheme.titleLarge),
        ),
        Expanded(
          child: VisitsListWidget(visits: travel.visits),
        )
      ],
    );
  }
}