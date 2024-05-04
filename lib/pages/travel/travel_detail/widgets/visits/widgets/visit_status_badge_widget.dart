import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/index.dart';

import 'package:shipping_pilot/widgets/index.dart';

class VisitStatusBadge extends StatelessWidget {
  final String status;
 
  const VisitStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {

    final statusText = {
      Visit.NEW_STATUS: '',
      Visit.IN_PROGRESS_STATUS: 'En curso',
      Visit.SUCCESSFUL_STATUS: 'Exitoso',
      Visit.FAILED_STATUS: 'Fallido',
    };

    if (status == Visit.NEW_STATUS) {
      //? empty widget returned.
      return const SizedBox.shrink();
    }

    return CustomBadge(text: statusText[status] ?? '');
  }
}