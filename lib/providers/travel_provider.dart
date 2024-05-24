import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

final travelProvider = StateNotifierProvider<TravelNotifier, TravelProviderModel>((ref) {
  return TravelNotifier(ref: ref);
});

class TravelNotifier extends StateNotifier<TravelProviderModel> {
  StateNotifierProviderRef<TravelNotifier, TravelProviderModel> ref;

  TravelNotifier({required this.ref}) : super(
    const TravelProviderModel(travels: <Travel>[], isLoading: false)
  );

  double _calculateVisitPrice(String newStatus) {
    UserProviderModel upm = ref.watch(userProvider);
    Pricing pricing = upm.settings!.pricing;

    switch (newStatus) {
      case Visit.SUCCESSFUL_STATUS:
        return pricing.successfulCoefficient * pricing.visitPrice;
      case Visit.FAILED_STATUS:
        return pricing.failedCoefficient * pricing.visitPrice;
      default:
        return pricing.visitPrice;
    }
  }

  double _calculateTravelPrice(Travel travel) {
    List<Visit> visits = travel.visits;
    double total = 0;

    for (Visit visit in visits) {
      total += visit.price;
    }

    return total;
  }

  //? buisness logic.
  void finalizeVisit(String travelId, String newStatus, Visit visit) async {
    Travel travel = state.travels.firstWhere((t) => t.id == travelId);

    int lastVisitIdx = travel.visits.length - 1;
    int visitIdx = travel.visits.indexOf(visit);

    //? update visit data.
    visit.status = newStatus;
    visit.price = _calculateVisitPrice(newStatus);
    await VisitService.update(visit);

    //? update travel data.
    travel.price = _calculateTravelPrice(travel);

    if (visitIdx == lastVisitIdx) {
      travel.status = Travel.FINISHED_STATUS;
    }

    TravelService.update(travel);

    //? update global state.
    updateTravel();
  }

  void startVisit(String travelId, Visit visit) async {
    Travel travel = state.travels.firstWhere((t) => t.id == travelId);

    int visitIdx = travel.visits.indexOf(visit);

    //? update the visit.
    visit.status = Visit.IN_PROGRESS_STATUS;
    await VisitService.update(visit);

    //? update the travel.
    if (visitIdx == 0) {
      travel.status = Travel.IN_PROGRESS_STATUS;
      TravelService.update(travel);
    }

    //? update global state.
    updateTravel();
  }

  Future<void> getTravels() async {
    state = state.copyWith(isLoading: true);

    List<Travel> travelsList = await TravelService.getAll();

    state = state.copyWith(isLoading: false, travels: travelsList);
  }

  Future<void> getDriverTravel(String travelId) async {
    List<Travel> travelList = [];

    state = state.copyWith(isLoading: true);

    Travel? travel = await TravelService.get(travelId);

    if (travel != null) {
      travelList.add(travel);
    }

    state = state.copyWith(isLoading: false, travels: travelList);
  }

  //? handle global state.
  void updateTravel() {
    List<Travel> travelList = [];

    for (Travel travel in state.travels) {
      travelList.add(travel.copyWith());
    }

    state = state.copyWith(travels: travelList);
  }
}
