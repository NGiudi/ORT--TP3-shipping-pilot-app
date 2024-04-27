import 'package:flutter/material.dart';

/* import 'package:shipping_pilot/models/models.dart'; */

class SidebarWidget extends StatelessWidget {
  //final User driver;

  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Nicolás Giudice'), //TODO: driver.fullName()
            accountEmail: Text('n.giudice@gmail.com'), //TODO: driver.email
            /* currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  driver.photoUrl,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ), */
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
