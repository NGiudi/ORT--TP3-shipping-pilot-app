import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shipping_pilot/widgets/widgets.dart';

import 'package:shipping_pilot/services/travels_service.dart';

class TravelDetailPage extends StatelessWidget {
  static const String name = 'TravelDetail';

  const TravelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final travelsService = Provider.of<TravelsService>(context);
    final travel = travelsService.travels[0];

    if (travelsService.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        )
      );
    }

    return Scaffold(
      drawer: SidebarWidget(driver: travel.driver),
      appBar: AppbarWidget(driver: travel.driver),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VehicleDetailWidget(vehicle: travel.vehicle),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 24),
            child: Text("Visitas", style: Theme.of(context).textTheme.titleLarge),
          ),
          Expanded(
            child: VisitsListWidget(visits: travel.visits),
          )
        ],
      ),
    );
  }
}