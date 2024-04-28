import 'package:flutter/material.dart';

import 'package:shipping_pilot/widgets/index.dart';

class VisitStatusBadge extends StatelessWidget {
  final String status;
 
  const VisitStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {

    final statusText = {
      'new': '',
      'in_progress': 'En curso',
      'successful': 'Exitoso',
      'failed': 'Fallido',
    };

    if (status == 'new') {
      //? empty widget returned.
      return const SizedBox.shrink();
    }

    return CustomBadge(text: statusText[status] ?? '');
  }
}