import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

final travelProdiver = StateNotifierProvider<TravelNotifier, Map<String, dynamic>>((ref) => TravelNotifier());

class TravelNotifier extends StateNotifier<Map<String, dynamic>> {
  TravelNotifier(): super({
    'isLoading': false,
    'settings': null,
    'travel': null,
    'user': null,
  });

  //? buisness logic.
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

  void finalizeVisit(String visitStauts , int visitIdx) {
    int lastVisitIdx = state['travel'].visits.length - 1;

    //? update visit data.
    state['travel'].visits[visitIdx].status = visitStauts;
    state['travel'].visits[visitIdx].price = _calculateVisitPrice(visitStauts);
    
    updateVisit(visitIdx);

    //? update travel data.
    state['travel'].price = _calculateTravelPrice();
    
    if (visitIdx == lastVisitIdx) {  
      state['travel'].status = Travel.FINISHED_STATUS;
    }

    TravelService.update(state['travel']);
  }

  void startVisit (int visitIdx) {
    state['travel'].visits[visitIdx].status = Visit.IN_PROGRESS_STATUS;
    updateVisit(visitIdx);

    if (visitIdx == 0) {  
      state['travel'].status = Travel.IN_PROGRESS_STATUS;
      TravelService.update(state['travel']);
    }
  }

  //? database logic.
  Future<void> login(int dni, String date) async {
    state = {...state, 'isLoading': true};

    Map<String, dynamic> user = await UserService.get(dni);
    user['doc_number'] = dni;

    Travel? travel = await TravelService.get('$dni-$date');

    Map<String, dynamic> settings = await SettingsService.get();

    state = {
      ...state,
      'isLoading': false,
      'settings': Settings.fromJson(settings),
      'travel': travel,
      'user': User.fromJson(user),
    };
  }

  Future<void> updateVisit(int idx) async {
    //? update the visit in the database.
    await VisitService.update(state['travel'].visits[idx]);

    //? update the state with the updated visits.
    state = {...state, 'travel': state['travel']!.copyWith()};
  }
}