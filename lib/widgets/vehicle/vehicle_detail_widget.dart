import 'package:flutter/material.dart';

import 'package:shipping_pilot/widgets/widgets.dart';

import 'package:shipping_pilot/models/models.dart';

class VehicleDetailWidget extends StatelessWidget {
  final Vehicle vehicle;
 
  const VehicleDetailWidget({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {    
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget( text: 'Vehículo'),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${vehicle.brand} ${vehicle.model}',
                style: Theme.of(context).textTheme.bodyLarge
              ),
              const SizedBox(height: 4),
              Text(
                'Patente: ${vehicle.licensePlate}',
                style: Theme.of(context).textTheme.bodySmall
              ),
              const SizedBox(height: 4),
              Text(
                'Color: ${vehicle.color}',
                style: Theme.of(context).textTheme.bodySmall
              ),
            ],
          ),
        ),
      ],
    );
  }
}