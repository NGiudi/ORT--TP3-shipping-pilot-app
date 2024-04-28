import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shipping_pilot/pages/visits/visit_detail/widgets/index.dart';
import 'package:shipping_pilot/widgets/widgets.dart';

import 'package:shipping_pilot/services/services.dart';

import 'package:shipping_pilot/models/models.dart';

class VisitDetailPage extends StatelessWidget {
  static const String name = 'VisitDetail';
  
  final int idx;

  const VisitDetailPage({super.key, required this.idx});

  @override
  Widget build(BuildContext context) {
    final travelsService = Provider.of<TravelsService>(context);
    
    final Travel? travel = travelsService.travel;
    final Visit visit = travel!.visits[idx];

    return Scaffold(
      appBar: const AppbarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClientDetailWidget(client: visit.buyer),
                    const DividerWidget(),
                    PackagesDetailWidget(visit: visit),
                    const DividerWidget(),
                    VisitPriceWidget(visit: visit),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
            child: SizedBox(
              width: double.infinity,
              child: VisitButtonWidget(idx: idx, visit: visit)
            ),
          ),
        ],
      ),
    );
  }
}