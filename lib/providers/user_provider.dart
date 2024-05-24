import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

final userProvider = StateNotifierProvider<UserProvider, UserProviderModel>(
    (ref) => UserProvider());

class UserProvider extends StateNotifier<UserProviderModel> {
  UserProvider() : super(
    const UserProviderModel(isLoading: false, settings: null, user: null)
  );

  //? buisness logic.
  Future<User?> login(int docNumber) async {
    state = state.copyWith(isLoading: true);

    //? get logged user data.
    User? newUser = await UserService.get(docNumber);

    if (newUser != null) {
      //? get settings data.
      Settings newSettings = await SettingsService.get();

      //? udate global state.
      state = state.copyWith(isLoading: false, settings: newSettings, user: newUser);    
    } else {
      state = state.copyWith(isLoading: false);
    }

    return newUser;
  }

  //? handle global state.
  void updateLoggedUser(User newUser) {
    state = state.copyWith(user: newUser);
  }

  void updateSettings(Settings newSettings) {
    state = state.copyWith(settings: newSettings);
  }
}
