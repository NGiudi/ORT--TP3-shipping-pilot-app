import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shipping_pilot/pages/travels/travel_detail/widgets/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

class TravelDetailContent extends StatelessWidget {
  static const String name = 'TravelDetail';

  const TravelDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    final travelsService = Provider.of<TravelsService>(context);

    final Travel? travel = travelsService.travel;
    
    if (travel == null) {
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
          TravelDetailWidget(travel: travel),
          const CustomDivider(),
          VehicleDetailWidget(vehicle: travel.vehicle),
          const CustomDivider(),
          const  SectionTitleWidget(text: 'Visitas'),
          VisitsListWidget(travel: travel)
        ],
      ),
    );
  }
}