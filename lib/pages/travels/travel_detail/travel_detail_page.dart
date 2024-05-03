import 'package:flutter/material.dart';

import 'package:shipping_pilot/providers/travel_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/pages/travels/travel_detail/travel_detail_content.dart';
import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

class TravelDetailPage extends ConsumerWidget {
  static const String name = 'TravelDetail';

  const TravelDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(travelProdiver)["isLoading"];

    //? Waiting to receive the route information.
    if (isLoading) {
      return const LoadingPage();
    }

    return const Scaffold(
      drawer: SidebarWidget(),
      appBar: AppbarWidget(),
      body: TravelDetailContent(),
    );
  }
}