import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/models.dart';

class CarDetailWidget extends StatelessWidget {
  final Car car;
 
  const CarDetailWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8, left: 16, top: 24),
          child: Text(
            "Vehículo",
            style: Theme.of(context).textTheme.titleLarge
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 24),
          child: Text(
            '${car.brand} ${car.model}',
            style: Theme.of(context).textTheme.bodyLarge
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 24, top: 8),
          child: Text(
            'Patente: ${car.licensePlate}',
            style: Theme.of(context).textTheme.bodySmall
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 24, top: 4),
          child: Text(
            'Color: ${car.color}',
            style: Theme.of(context).textTheme.bodySmall
          ),
        ),
      ],
    );
  }
}