import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/pages/common/scrollable_content_with_button_layout_page.dart';
import 'package:shipping_pilot/pages/visit/visit_detail/widgets/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitDetailPage extends ConsumerWidget {
  static const String name = 'VisitDetail';

  final int travelIdx;
  final int visitIdx;

  const VisitDetailPage({
    super.key,
    this.travelIdx = 0,
    required this.visitIdx
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {   
    final List<Travel?> travels = ref.watch(travelProvider)['travels'];
    
    //TODO: agregar mensaje de error.
    if (travels.isEmpty || travels[travelIdx]!.visits.isEmpty) {
      return const Scaffold();
    }

    final Visit visit = travels[travelIdx]!.visits[visitIdx];

    return ScrollableContentWithButtonLayoutPage(
      button: VisitButtonWidget(visitIdx: visitIdx),
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