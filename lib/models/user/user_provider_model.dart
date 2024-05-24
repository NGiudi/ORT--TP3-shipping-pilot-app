import 'package:shipping_pilot/models/index.dart';

class UserProviderModel {
  final Settings? settings;
  final bool isLoading;
  final User? user;

  const UserProviderModel({
    required this.isLoading,
    required this.settings,
    required this.user,
  });

  UserProviderModel copyWith({
    bool? isLoading,
    Settings? settings,
    User? user,
  }) {
    return UserProviderModel(
      isLoading: isLoading ?? this.isLoading,
      settings: settings ?? this.settings?.copyWith(),
      user: user ?? this.user?.copyWith(),
    );
  }
}