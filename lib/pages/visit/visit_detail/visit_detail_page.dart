import 'package:flutter/material.dart';

import 'package:shipping_pilot/providers/travel_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/pages/common/scrollable_content_with_button_layout_page.dart';
import 'package:shipping_pilot/pages/visit/visit_detail/widgets/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitDetailPage extends ConsumerWidget {
  static const String name = 'VisitDetail';
  final int idx;

  const VisitDetailPage({super.key, required this.idx});

  @override
  Widget build(BuildContext context, WidgetRef ref) {   
    final travel = ref.watch(travelProdiver)["travel"];

    final Visit visit = travel.visits[idx];

    return ScrollableContentWithButtonLayoutPage(
      button: VisitButtonWidget(idx: idx),
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