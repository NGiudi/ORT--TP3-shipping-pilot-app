import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shipping_pilot/pages/pages.dart';

import 'package:shipping_pilot/models/models.dart';

class VisitListItemWidget extends StatelessWidget {
  final Visit visit;

  const VisitListItemWidget({super.key, required this.visit });

  @override
  Widget build(BuildContext context) {    
    return ListTile(
      onTap: () {
        context.pushNamed(VisitDetailPage.name);
      },
      subtitle: Text(visit.buyer.fullName()),
      title: Text(visit.address.fullAddress()),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}