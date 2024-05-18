import 'package:flutter/material.dart';

import 'package:shipping_pilot/models/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

class VisitPriceWidget extends StatelessWidget {
  final Visit visit;

  const VisitPriceWidget({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    final double price = visit.price;

    final Map<String, String> prefixText = {
      Visit.NEW_STATUS: 'Precio estimado',
      Visit.IN_PROGRESS_STATUS: 'Precio estimado',
      Visit.SUCCESSFUL_STATUS: 'Precio',
      Visit.FAILED_STATUS: 'Precio',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(text: 'Precio'),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldWidget(
                  text: price.toString(), title: prefixText[visit.status]!)
            ],
          ),
        ),
      ],
    );
  }
}
