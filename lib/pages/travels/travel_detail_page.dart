import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shipping_pilot/widgets/widgets.dart';

import 'package:shipping_pilot/services/travels_service.dart';

import 'package:shipping_pilot/models/models.dart';

class TravelDetailPage extends StatelessWidget {
  static const String name = 'TravelDetail';

  const TravelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final travelsService = Provider.of<TravelsService>(context);

    //? Waiting to receive the route information.
    if (travelsService.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        )
      );
    }

    final Travel? travel = travelsService.travel;
    
    //TODO: diseñar el empty state y revisar mejor si debe ir aca o dentro del Scaffold del return de la linea 39.
    if (travel == null) {
      return const Scaffold(
        body: Center(
          child: Text('empty state'),
        )
      );
    }

    return Scaffold(
      drawer: SidebarWidget(driver: travel.driver),
      appBar: const AppbarWidget(),
      body: Column(
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
      ),
    );
  }
}