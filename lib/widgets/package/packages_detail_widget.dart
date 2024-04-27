import 'package:flutter/material.dart';

import 'package:shipping_pilot/widgets/widgets.dart';

import 'package:shipping_pilot/models/models.dart';

class PackagesDetailWidget extends StatelessWidget {
  final Visit visit;

  const PackagesDetailWidget({
    super.key,
    required this.visit,
  });

  @override
  Widget build(BuildContext context) {    
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(text: 'Paquetes'),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldWidget(
                title: 'Cantidad de paquetes',
                text: visit.stats.packagesCount.toString(),
              ),
              const SizedBox(height: 8),
              Text(
                'Identificadores de los paquetes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:  Theme.of(context).textTheme.bodyMedium!.fontSize,
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinear los elementos a la izquierda
                  children: visit.packages.map((String packageId) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.work_outline_outlined),
                          const SizedBox(width: 8),
                          Text(packageId),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}