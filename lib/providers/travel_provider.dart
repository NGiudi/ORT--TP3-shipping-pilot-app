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
  void login(int dni, String date) async {
    state = {...state, 'isLoading': true};

    //? get logged user data.
    Map<String, dynamic> user = await UserService.get(dni);
    user['doc_number'] = dni;

    //? get travel for today.
    Travel? travel = await TravelService.get('$dni-$date');

    //? get settings data.
    Map<String, dynamic> settings = await SettingsService.get();

    //? udate global state.
    state = {
      ...state,
      'isLoading': false,
      'settings': Settings.fromJson(settings),
      'travel': travel,
      'user': User.fromJson(user),
    };
  }

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
  void updateLoggedUser(User user) {
    state = {...state, 'user': user};
  }

  void updateTravel() {
    state = {...state, 'travel': state['travel']!.copyWith()};
  }
}