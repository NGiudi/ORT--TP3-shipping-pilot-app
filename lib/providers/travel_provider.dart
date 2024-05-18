import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

final travelProvider = StateNotifierProvider<TravelNotifier, Map<String, dynamic>>((ref) {
  Settings? settings = ref.watch(userProvider)['settings'];

  return TravelNotifier(settings: settings);
});

class TravelNotifier extends StateNotifier<Map<String, dynamic>> {
  final Settings? settings;

  TravelNotifier({ this.settings }) : super({
    'isLoading': false,
    'travels': [],
  });

  double _calculateVisitPrice(String visitStauts) {
    Pricing pricing = settings!.pricing;

    switch (visitStauts) {
      case Visit.SUCCESSFUL_STATUS:
        return pricing.successfulCoefficient * pricing.visitPrice;
      case Visit.FAILED_STATUS:
        return pricing.failedCoefficient * pricing.visitPrice;
      default:
        return pricing.visitPrice;
    }
  }

  double _calculateTravelPrice(int travelIdx) {
    List<Visit> visits = state['travels'][travelIdx].visits;
    double total = 0;

    for (Visit visit in visits) {
      total += visit.price;
    }

    return total;
  }

  //? buisness logic.
  void finalizeVisit(String visitStauts , int visitIdx, int travelIdx) async {
    int lastVisitIdx = state['travels'][travelIdx].visits.length - 1;

    //? update visit data.
    state['travels'][travelIdx].visits[visitIdx].status = visitStauts;
    state['travels'][travelIdx].visits[visitIdx].price = _calculateVisitPrice(visitStauts);
    
    //? update the visit in the database.
    await VisitService.update(state['travels'][travelIdx].visits[visitIdx]);

    //? update travel data.
    state['travels'][travelIdx].price = _calculateTravelPrice(travelIdx);
    
    if (visitIdx == lastVisitIdx) {  
      state['travels'][travelIdx].status = Travel.FINISHED_STATUS;
    }

    TravelService.update(state['travels'][travelIdx]);

    //? update global state.
    updateTravel();
  }

  void startVisit(int visitIdx, int travelIdx) async {
    state['travels'][travelIdx].visits[visitIdx].status = Visit.IN_PROGRESS_STATUS;
    
    //? update the visit in the database.
    await VisitService.update(state['travels'][travelIdx].visits[visitIdx]);
    
    if (visitIdx == 0) {  
      state['travels'][travelIdx].status = Travel.IN_PROGRESS_STATUS;
      TravelService.update(state['travels'][travelIdx]);
    }

    //? update global state.
    updateTravel();
  }

  Future<void> getTravels() async {
    state = { ...state, 'isLoading': true };

    List<Travel> travels = await TravelService.getAll();
  
    state = {
      ...state,
      'isLoading': false,
      'travels': travels,
    };
  }

  Future<void> getDriverTravel(String travelId) async {
    List<Travel> travelList = [];

    state = { ...state, 'isLoading': true };

    Travel? travel = await TravelService.get(travelId);

    if (travel != null) {
      travelList.add(travel);
    }

    state = {
      ...state,
      'isLoading': false,
      'travels': travelList,
    };
  }

  //? handle global state.
  void updateTravel() {
    List<Travel?> travels = [];

    for (Travel travel in state['travels']) {
      travels.add(travel.copyWith());
    }

    state = {...state, 'travels': travels};
  }
}