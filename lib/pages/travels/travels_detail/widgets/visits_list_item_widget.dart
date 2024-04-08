import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/models.dart';

class VisitListItemWidget extends StatelessWidget {
  static const String name = 'TravelDetail';

  final List<Visit> visits;

  const VisitListItemWidget({super.key, required this.visits });

  @override
  Widget build(BuildContext context) {    
    return ListTile(
      onTap: () { },
      subtitle: Text(visits[0].buyer.fullName()),
      title: Text(visits[0].address.fullAddress()),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}