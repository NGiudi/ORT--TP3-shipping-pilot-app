import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shipping_pilot/widgets/widgets.dart';
import 'package:shipping_pilot/pages/pages.dart';

import 'package:shipping_pilot/models/models.dart';

class _VisitListItemWidget extends StatelessWidget {
  final Visit visit;

  const _VisitListItemWidget({ required this.visit });

  @override
  Widget build(BuildContext context) {    
    return ListTile(
      onTap: () {
        context.pushNamed(VisitDetailPage.name);
      },
      subtitle: Text(visit.buyer.fullName()),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'ETA: ${visit.formattedETA()}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(width: 8),
              VisitStatusBadge(status: visit.status),
            ],
          ),
          const SizedBox(height: 4),
          Text(visit.address.fullAddress()),
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

class VisitsListWidget extends StatelessWidget {
  final List<Visit> visits;

  const VisitsListWidget({super.key, required this.visits});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: visits.length,
      itemBuilder: (context, idx) {
        return _VisitListItemWidget(visit: visits[idx]);
      },
    );
  }
}