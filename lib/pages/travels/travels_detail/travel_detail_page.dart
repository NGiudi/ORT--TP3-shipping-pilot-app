import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shipping_pilot/pages/travels/travels_detail/widgets/visits_list_item_widget.dart';

import 'package:shipping_pilot/services/travels_service.dart';

class TravelDetailPage extends StatelessWidget {
  static const String name = 'TravelDetail';

  const TravelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final travelsService = Provider.of<TravelsService>(context);

    if (travelsService.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        )
      );
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: travelsService.travels.length,
        itemBuilder: (context, idx) {
          return VisitListItemWidget(visits: travelsService.travels[idx].visits);
        },
      ),
    );
  }
}