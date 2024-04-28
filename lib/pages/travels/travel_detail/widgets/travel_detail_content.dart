import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shipping_pilot/pages/travels/travel_detail/widgets/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TravelDetailWidget(travel: travel),
          const DividerWidget(),
          VehicleDetailWidget(vehicle: travel.vehicle),
          const DividerWidget(),
          const  SectionTitleWidget(text: 'Visitas'),
          Expanded(
            child: VisitsListWidget(visits: travel.visits),
          )
        ],
      ),
    );
  }
}