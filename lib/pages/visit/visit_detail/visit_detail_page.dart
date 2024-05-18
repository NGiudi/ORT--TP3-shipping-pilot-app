import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/pages/travel/travel_detail/widgets/index.dart';
import 'package:shipping_pilot/pages/visit/visit_detail/widgets/index.dart';
import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitDetailPage extends ConsumerWidget {
  static const String name = 'VisitDetail';

  final String? travelId;
  final String visitId;

  const VisitDetailPage({super.key, this.travelId, required this.visitId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Travel?> travels = ref.watch(travelProvider)['travels'];

    if (travels.isEmpty || travelId == null) {
      return TravelDetailEmptyStateWidget(travelId: travelId);
    }

    Travel? travel = travels.firstWhere((t) => t!.id == travelId);

    if (travel == null) {
      return TravelDetailEmptyStateWidget(travelId: travelId);
    }

    final Visit visit = travel.visits.firstWhere((v) => v.id == visitId);

    return ScrollableContentWithButtonLayoutPage(
      button: VisitButtonWidget(travelId: travelId!, visit: visit),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClientDetailWidget(client: visit.buyer),
          const CustomDivider(),
          PackagesDetailWidget(visit: visit),
          const CustomDivider(),
          VisitPriceWidget(visit: visit),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
