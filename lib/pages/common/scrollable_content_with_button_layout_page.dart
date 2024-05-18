import 'package:flutter/material.dart';

import 'package:shipping_pilot/widgets/index.dart';

class ScrollableContentWithButtonLayoutPage extends StatelessWidget {
  final Widget content;
  final Widget button;

  const ScrollableContentWithButtonLayoutPage(
      {super.key, required this.button, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: content,
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
            child: SizedBox(
              width: double.infinity,
              child: button,
            ),
          ),
        ],
      ),
    );
  }
}
