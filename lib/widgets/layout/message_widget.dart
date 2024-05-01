import 'package:flutter/material.dart';

import 'package:shipping_pilot/widgets/index.dart';

class MessageWidget extends StatelessWidget {
  final Widget icon;
  final String text;
  final String title;

  const MessageWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 20),
          TitleWidget(
            text: title,
          ),
          const SizedBox(height: 10),
          TextWidget(
            center: true,
            text: text,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
