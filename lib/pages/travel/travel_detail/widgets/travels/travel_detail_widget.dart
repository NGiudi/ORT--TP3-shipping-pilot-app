import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/pages/travel/travel_detail/widgets/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

import 'package:shipping_pilot/models/index.dart';

class TravelDetailWidget extends ConsumerWidget {
  final Travel travel;

  const TravelDetailWidget({super.key, required this.travel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User loggedUser = ref.watch(userProvider)['user'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(text: 'Recorrido'),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TravelStatusBadgeWidget(status: travel.status),
              const SizedBox(height: 4),
              Text(
                  '${travel.stats.packagesCount} paquete(s), ${travel.stats.visitsCount} visita(s)',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 4),
              Text('ETA: ${travel.stats.formattedETA()}',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              FieldWidget(
                text: travel.price.toString(),
                title: 'Precio',
              ),
              Visibility(
                visible: loggedUser.isAdmin() && !travel.inFinalStatus(),
                child:TravelCancelButton(travel: travel),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
