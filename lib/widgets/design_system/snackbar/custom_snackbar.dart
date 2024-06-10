import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showErrorSnackbar(BuildContext context, String text) {
    SnackBar snackbar = SnackBar(
      backgroundColor: Theme.of(context).colorScheme.error,
      behavior: SnackBarBehavior.floating,
      content: Text(text),
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void showSuccessSnackbar(BuildContext context, String text) {
    SnackBar snackbar = SnackBar(
      backgroundColor: const Color(0xFFA3D9A5),
      behavior: SnackBarBehavior.floating,
      content: Text(text),
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
