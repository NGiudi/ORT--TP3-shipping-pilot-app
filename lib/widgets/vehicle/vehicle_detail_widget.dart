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
              FieldWidget(
                title: 'Vehículo',
                text: '${vehicle.brand} ${vehicle.model}',
              ),
              const SizedBox(height: 8),
              FieldWidget(
                title: 'Patente',
                text: vehicle.licensePlate,
              ),
              const SizedBox(height: 8),
              FieldWidget(
                title: 'Color',
                text: vehicle.color,
              ),
            ],
          ),
        ),
      ],
    );
  }
}