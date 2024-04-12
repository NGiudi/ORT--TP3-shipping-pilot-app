import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/models.dart';

class VehicleDetailWidget extends StatelessWidget {
  final Vehicle vehicle;
 
  const VehicleDetailWidget({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {    
    return Padding(
      padding: const EdgeInsets.only(left: 16), 
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vehículo",
            style: Theme.of(context).textTheme.titleLarge
          ),
          const SizedBox(height: 8),
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
      ),
    );
  }
}