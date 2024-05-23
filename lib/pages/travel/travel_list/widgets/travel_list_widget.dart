import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shipping_pilot/widgets/index.dart';

import 'package:shipping_pilot/models/index.dart';

class TravelListWidget extends StatelessWidget {
  static const String name = 'TravelList';

  final List<Travel> travels;

  const TravelListWidget({ super.key, required this.travels });

  @override
  Widget build(BuildContext context) {

    if (travels.isEmpty) {
      return const TravelDetailEmptyStateWidget();
    }

    return Column(
      children: travels.map((Travel travel) {
        return ListTile(
          onTap: () {
            context.push('/travel_detail/${travel.id}');
          },
          subtitle: Text('Conductor: ${travel.driver.fullName()}'),
          title: Row(
            children: [
              const Icon(Icons.fire_truck),
              const SizedBox(width: 8),
              Text(travel.getDateOfId()),
              const SizedBox(width: 8),
              TravelStatusBadgeWidget(status: travel.status)
            ],
          ),
          trailing: const Icon(Icons.chevron_right),
        );
      }).toList(),
    );
  }
}
