import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

class TravelListPage extends ConsumerWidget {
  static const String name = 'TravelList';

  const TravelListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLoading = ref.watch(travelProvider)['isLoading'];

    //? Waiting to receive the route information.
    if (isLoading) {
      return const LoadingPage();
    }

    return const Scaffold(
      drawer: SidebarWidget(),
      appBar: AppbarWidget(),
      body: Center(
        child: Text('Lista de recorridos'),
      ),
    );
  }
}