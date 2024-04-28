import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shipping_pilot/pages/travels/travel_detail/widgets/index.dart';
import 'package:shipping_pilot/widgets/widgets.dart';
import 'package:shipping_pilot/pages/pages.dart';

import 'package:shipping_pilot/services/travels_service.dart';

class TravelDetailPage extends StatelessWidget {
  static const String name = 'TravelDetail';

  const TravelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final travelsService = Provider.of<TravelsService>(context);

    //? Waiting to receive the route information.
    if (travelsService.isLoading) {
      return const LoadingPage();
    }

    return const Scaffold(
      drawer: SidebarWidget(),
      appBar: AppbarWidget(),
      body: TravelDetailContent(),
    );
  }
}