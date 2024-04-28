import 'package:flutter/material.dart';

class VisitStatusRadioWidget extends StatefulWidget {

  const VisitStatusRadioWidget({super.key });

  @override
  State<VisitStatusRadioWidget> createState() => _VisitStatusRadioWidgetState();
}

class _VisitStatusRadioWidgetState extends State<VisitStatusRadioWidget> {
  String _selected = 'success';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile(
          title: const Text('Exitosa'),
          value: 'success',
          groupValue: _selected,
          onChanged: (value) {
            setState(() {
              _selected = value!;
            });
          }
        ),
        RadioListTile(
          title: const Text('Fallida'),
          value: 'failed',
          groupValue: _selected,
          onChanged: (value) {
            setState(() {
              _selected = value!;
            });
          },
        ),
      ]
    );
  }
}