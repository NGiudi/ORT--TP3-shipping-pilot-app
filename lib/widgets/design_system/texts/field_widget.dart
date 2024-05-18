import 'package:flutter/material.dart';

import 'package:shipping_pilot/widgets/index.dart';

class FieldWidget extends StatelessWidget {
  final String title;
  final String text;

  const FieldWidget({super.key, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 4),
        child: TextWidget(text: text),
      ),
    ]);
  }
}
