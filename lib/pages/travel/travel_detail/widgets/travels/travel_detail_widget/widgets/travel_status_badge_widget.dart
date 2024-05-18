import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/index.dart';

import 'package:shipping_pilot/widgets/index.dart';

class TravelStatusBadgeWidget extends StatelessWidget {
  final String status;
 
  const TravelStatusBadgeWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {

    final statusText = {
      Travel.NEW_STATUS: 'En espera de inicio',
      Travel.IN_PROGRESS_STATUS: 'En curso',
      Travel.FINISHED_STATUS: 'Finalizado',
    };
    
    return CustomBadge(text: statusText[status] ?? '');
  }
}