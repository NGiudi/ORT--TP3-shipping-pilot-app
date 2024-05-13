import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

final userProvider = StateNotifierProvider<UserProvider, Map<String, dynamic>>((ref) => UserProvider());

class UserProvider extends StateNotifier<Map<String, dynamic>> {
  UserProvider(): super({
    'isLoading': false,
    'settings': null,
    'user': null,
  });

  //? buisness logic.
  void login(int dni) async {
    state = {...state, 'isLoading': true};

    //? get logged user data.
    Map<String, dynamic> user = await UserService.get(dni);
    user['doc_number'] = dni;

    //? get settings data.
    Map<String, dynamic> settings = await SettingsService.get();

    //? udate global state.
    state = {
      ...state,
      'isLoading': false,
      'settings': Settings.fromJson(settings),
      'user': User.fromJson(user),
    };
  }

  //? handle global state.
  void updateLoggedUser(User user) {
    state = {...state, 'user': user};
  }
}