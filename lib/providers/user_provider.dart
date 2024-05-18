import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

final userProvider = StateNotifierProvider<UserProvider, Map<String, dynamic>>(
    (ref) => UserProvider());

class UserProvider extends StateNotifier<Map<String, dynamic>> {
  UserProvider()
      : super({
          'isLoading': false,
          'settings': null,
          'user': null,
        });

  //? buisness logic.
  Future<User?> login(int docNumber) async {
    state = {...state, 'isLoading': true};

    //? get logged user data.
    User? user = await UserService.get(docNumber);

    if (user != null) {
      //? get settings data.
      Settings settings = await SettingsService.get();

      //? udate global state.
      state = {
        ...state,
        'isLoading': false,
        'settings': settings,
        'user': user,
      };
    } else {
      state = {...state, 'isLoading': false};
    }

    return user;
  }

  //? handle global state.
  void updateLoggedUser(User user) {
    state = {...state, 'user': user};
  }
}
