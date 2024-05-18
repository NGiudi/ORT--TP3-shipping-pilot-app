import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  final String text;

  const SectionTitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(text, style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 8),
    ]);
  }
}
