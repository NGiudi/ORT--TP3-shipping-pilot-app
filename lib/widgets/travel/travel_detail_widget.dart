import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/models.dart';

class TravelDetailWidget extends StatelessWidget {
  final Travel travel;
 
  const TravelDetailWidget({super.key, required this.travel});

  @override
  Widget build(BuildContext context) {    
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recorrido #',
            style: Theme.of(context).textTheme.titleLarge
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${travel.stats.packagesCount} paquete(s), ${travel.stats.visitsCount} visita(s)',
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                const SizedBox( height: 4 ),
                Text(
                  'ETA: ${travel.stats.eta}',
                  style: Theme.of(context).textTheme.bodyMedium
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}