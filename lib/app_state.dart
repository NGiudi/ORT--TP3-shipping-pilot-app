import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shipping_pilot/services/services.dart';
import 'package:shipping_pilot/main.dart';

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TravelsService()),
      ],
      child: MainApp(),
    );
  }
}
