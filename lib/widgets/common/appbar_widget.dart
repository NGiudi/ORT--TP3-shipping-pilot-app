import 'package:flutter/material.dart';

import 'package:shipping_pilot/models/models.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final User driver;

  const AppbarWidget({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                driver.photoUrl,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
        
      ],
      title: Text("ShippingPilot", style: Theme.of(context).textTheme.titleMedium),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
