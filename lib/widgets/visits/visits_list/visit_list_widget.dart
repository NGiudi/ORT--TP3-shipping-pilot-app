import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/models.dart';

import 'package:shipping_pilot/widgets/visits/visits_list/visits_list_item_widget.dart';

class VisitsListWidget extends StatelessWidget {
  final List<Visit> visits;

  const VisitsListWidget({super.key, required this.visits});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: visits.length,
      itemBuilder: (context, idx) {
        return VisitListItemWidget(visit: visits[idx]);
      },
    );
  }
}