import 'package:flutter/material.dart';

import 'package:shipping_pilot/widgets/widgets.dart';

class TravelStatusBadge extends StatelessWidget {
  final String status;
 
  const TravelStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {

    final statusText = {
      'new': 'En espera de inicio',
      'in_progress': 'En curso',
      'finished': 'Finalizado',
    };
    
    return CustomBadge(text: statusText[status] ?? '');
  }
}