import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shipping_pilot/pages/common/scrollable_content_with_button_layout_page.dart';

import 'package:shipping_pilot/pages/visits/visit_detail/widgets/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

class VisitDetailPage extends StatelessWidget {
  static const String name = 'VisitDetail';
  
  final int idx;

  const VisitDetailPage({super.key, required this.idx});

  @override
  Widget build(BuildContext context) {
    final travelsService = Provider.of<TravelsService>(context);
    
    final Travel? travel = travelsService.travel;
    final Visit visit = travel!.visits[idx];

    return ScrollableContentWithButtonLayoutPage(
      button: VisitButtonWidget(idx: idx, visit: visit),
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