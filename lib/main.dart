import 'package:flutter/material.dart';

import 'package:shipping_pilot/core/app_router.dart';
import 'package:shipping_pilot/app_state.dart';

void main() {
  runApp(const AppState());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final ThemeData darkTheme = ThemeData(
    colorSchemeSeed: Colors.red,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      routerConfig: appRouter,
    );
  }
}
