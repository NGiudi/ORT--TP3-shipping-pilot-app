import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

final travelProvider = StateNotifierProvider<TravelNotifier, Map<String, dynamic>>((ref) => TravelNotifier());

class TravelNotifier extends StateNotifier<Map<String, dynamic>> {
  TravelNotifier(): super({
    'isLoading': false,
    'travel': null,
  });

  double _calculateVisitPrice(String visitStauts) {
    Pricing pricing = state['settings'].pricing;

    switch (visitStauts) {
      case Visit.SUCCESSFUL_STATUS:
        return pricing.successfulCoefficient * pricing.visitPrice;
      case Visit.FAILED_STATUS:
        return pricing.failedCoefficient * pricing.visitPrice;
      default:
        return pricing.visitPrice;
    }
  }

  double _calculateTravelPrice() {
    List<Visit> visits = state['travel'].visits;
    double total = 0;

    for (Visit visit in visits) {
      total += visit.price;
    }

    return total;
  }

  //? buisness logic.
  void finalizeVisit(String visitStauts , int visitIdx) async {
    int lastVisitIdx = state['travel'].visits.length - 1;

    //? update visit data.
    state['travel'].visits[visitIdx].status = visitStauts;
    state['travel'].visits[visitIdx].price = _calculateVisitPrice(visitStauts);
    
    //? update the visit in the database.
    await VisitService.update(state['travel'].visits[visitIdx]);

    //? update travel data.
    state['travel'].price = _calculateTravelPrice();
    
    if (visitIdx == lastVisitIdx) {  
      state['travel'].status = Travel.FINISHED_STATUS;
    }

    TravelService.update(state['travel']);

    //? update global state.
    updateTravel();
  }

  void startVisit (int visitIdx) async {
    state['travel'].visits[visitIdx].status = Visit.IN_PROGRESS_STATUS;
    
    //? update the visit in the database.
    await VisitService.update(state['travel'].visits[visitIdx]);
    
    if (visitIdx == 0) {  
      state['travel'].status = Travel.IN_PROGRESS_STATUS;
      TravelService.update(state['travel']);
    }

    //? update global state.
    updateTravel();
  }

  //? handle global state.
  void updateTravel() {
    state = {...state, 'travel': state['travel']!.copyWith()};
  }
}