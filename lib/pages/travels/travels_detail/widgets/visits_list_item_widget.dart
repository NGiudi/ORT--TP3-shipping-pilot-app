import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/models.dart';

class VisitListItemWidget extends StatelessWidget {
  final Visit visit;

  const VisitListItemWidget({super.key, required this.visit });

  @override
  Widget build(BuildContext context) {    
    return ListTile(
      onTap: () { },
      subtitle: Text(visit.buyer.fullName()),
      title: Text(visit.address.fullAddress()),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}