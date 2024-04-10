import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/models.dart';

class VehicleDetailWidget extends StatelessWidget {
  final Vehicle vehicle;
 
  const VehicleDetailWidget({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8, left: 16),
          child: Text(
            "Vehículo",
            style: Theme.of(context).textTheme.titleLarge
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 24),
          child: Text(
            '${vehicle.brand} ${vehicle.model}',
            style: Theme.of(context).textTheme.bodyLarge
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 24, top: 8),
          child: Text(
            'Patente: ${vehicle.licensePlate}',
            style: Theme.of(context).textTheme.bodySmall
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 24, top: 4),
          child: Text(
            'Color: ${vehicle.color}',
            style: Theme.of(context).textTheme.bodySmall
          ),
        ),
      ],
    );
  }
}