import 'package:flutter/material.dart';

import 'package:shipping_pilot/pages/visits/visit_finalize/widgets/index.dart';
import 'package:shipping_pilot/pages/common/index.dart';

class VisitFinalizePage extends StatelessWidget {
  static const String name = 'VisitFinalize';

  final int idx;

  const VisitFinalizePage({super.key, required this.idx});

  @override
  Widget build(BuildContext context) {
    return ScrollableContentWithButtonLayoutPage(
      button: ElevatedButton(
        onPressed: () {},
        child: const Text('Guardar'),
      ),
      content: const VisitStatusRadioWidget(),
    );
  }
}

