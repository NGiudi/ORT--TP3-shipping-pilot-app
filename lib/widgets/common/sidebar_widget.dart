import 'package:flutter/material.dart';

import 'package:shipping_pilot/models/models.dart';

class SidebarWidget extends StatelessWidget {
  final User driver;

  const SidebarWidget({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(driver.fullName()), 
            accountEmail: Text(driver.email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  driver.photoUrl,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            onTap: () => {}, //TODO: add logout function.
            title: const Text('Cerrar sesión'),  
          ),
        ],
      ),
    );
  }
}
