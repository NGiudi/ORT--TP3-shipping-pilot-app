import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

final travelProdiver = StateNotifierProvider<TravelNotifier, Map<String, dynamic>>((ref) => TravelNotifier());

class TravelNotifier extends StateNotifier<Map<String, dynamic>> {
  //TODO: crear el modelo para este Map.
  TravelNotifier(): super({
    "isLoading": false,
    "travel": null,
  });

  void loadTravel(id) async {
    state = {...state, "isLoading": true};

    Travel travel = await TravelService.get(id);

    state = {...state, "isLoading": false, "travel": travel};
  }
}