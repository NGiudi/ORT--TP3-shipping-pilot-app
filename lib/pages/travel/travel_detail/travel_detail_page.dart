import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/models/index.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/pages/travel/travel_detail/travel_detail_content.dart';
import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

class TravelDetailPage extends ConsumerWidget {
  static const String name = 'TravelDetail';

  final String travelId;

  const TravelDetailPage({super.key, required this.travelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TravelProviderModel tpm = ref.watch(travelProvider);
    bool isLoading = tpm.isLoading;
  
    final UserProviderModel upm = ref.watch(userProvider);
    User? loggedUser = upm.user;

    //TODO: Agregar mensaje de error de que no existe un usuario logueado.
    if (loggedUser == null) {
      return const SizedBox();
    }

    //? Waiting to receive the route information.
    if (isLoading) {
      return const LoadingPage();
    }

    return Scaffold(
      drawer: loggedUser.isAdmin() ? null : const SidebarWidget(),
      appBar: const AppbarWidget(),
      body: TravelDetailContent(travelId: travelId),
    );
  }
}
