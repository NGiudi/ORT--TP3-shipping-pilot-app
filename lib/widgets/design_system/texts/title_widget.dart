import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final bool center;
  final String text;

  const TitleWidget({super.key, this.center = false, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: center ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
      ),
    );
  }
}
//
