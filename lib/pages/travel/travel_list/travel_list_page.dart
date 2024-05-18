import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/models/index.dart';

class TravelListPage extends ConsumerWidget {
  static const String name = 'TravelList';

  const TravelListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, dynamic> travelObj = ref.watch(travelProvider);

    //? Waiting to receive the route information.
    if (travelObj['isLoading']) {
      return const LoadingPage();
    }

    List<Travel> travels = travelObj['travels'];

    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: const AppbarWidget(),
      body: ListView.builder(
        itemCount: travels.length,
        itemBuilder: (context, idx) {
          Travel travel = travels[idx];

          return ListTile(
            onTap: () {
              context.push('/travel_detail/${travel.id}');
            },
            subtitle: Text('Conductor: ${travel.driver.fullName()}'),
            title: Text('Recorrido del ${travel.getDateOfId()}'),
            trailing: const Icon(Icons.chevron_right),
          );
        }
      ),
    );
  }
}