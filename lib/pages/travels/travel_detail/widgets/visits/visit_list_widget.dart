import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shipping_pilot/pages/travels/travel_detail/widgets/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitsListWidget extends StatelessWidget {
  final Travel travel;

  const VisitsListWidget({super.key, required this.travel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: travel.visits.map((Visit visit) {
        return ListTile(
          enabled: travel.currentVisit() == visit.id,
          onTap: () {
            context.push('/visit_detail/${visit.getIndex()}');
          },
          subtitle: Text(visit.buyer.fullName()),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'ETA: ${visit.stats.formattedETA()}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 8),
                  VisitStatusBadge(status: visit.status),
                ],
              ),
              const SizedBox(height: 4),
              Text(visit.buyer.address.streetAddress()),
            ],
          ),
          trailing: const Icon(Icons.chevron_right),
        );
      }).toList(),
    );
  }
}