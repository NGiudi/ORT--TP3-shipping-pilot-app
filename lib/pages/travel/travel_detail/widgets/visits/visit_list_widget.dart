import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/pages/travel/travel_detail/widgets/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitsListWidget extends ConsumerWidget {
  final Travel travel;

  const VisitsListWidget({super.key, required this.travel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User loggedUser = ref.watch(userProvider)['user'];

    return Column(
      children: travel.visits.map((Visit visit) {
        return ListTile(
          enabled: loggedUser.isAdmin() || travel.currentVisit() == visit.id,
          onTap: () {
            context
                .push('/visit_detail/${visit.id}?travelId=${visit.travelId}');
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
