import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final bool center;
  final String text;

  const TextWidget({super.key, this.center = false, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: center ? TextAlign.center : TextAlign.start,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
