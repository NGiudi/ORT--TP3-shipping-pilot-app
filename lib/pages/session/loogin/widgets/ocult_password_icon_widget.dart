import 'package:flutter/material.dart';

class OcultPasswordIconWidget extends StatelessWidget {
  final Function()? onPressed;
  final bool visible;

  const OcultPasswordIconWidget({
    super.key,
    this.onPressed,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: IconButton(
        icon: Icon(visible
            ? Icons.visibility
            : Icons.visibility_off),
        onPressed: onPressed,
      ),
    );
  }
}

