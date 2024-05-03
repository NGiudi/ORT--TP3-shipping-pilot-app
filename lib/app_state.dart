import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/main.dart';

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: SafeArea(
        child: MainApp(),
      ),
    );
  }
}
