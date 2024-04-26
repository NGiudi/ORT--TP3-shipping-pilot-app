import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Row(
        children: [
          ClientDetailWidget(client: visit.buyer),
        ],
      ),
    );
  }
}