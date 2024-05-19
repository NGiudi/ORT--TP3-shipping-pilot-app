import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/models/index.dart';

class SidebarWidget extends ConsumerWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User user = ref.watch(userProvider)['user'];

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.fullName()),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  user.photoUrl,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit_outlined),
            onTap: () {
              context.pushNamed(EditProfilePage.name);
            },
            title: const Text('Datos personales'),
          ),
          user.isAdmin() ? ListTile(
            leading: const Icon(Icons.price_change_outlined),
            onTap: () {
              context.pushNamed(EditPricingPage.name);
            },
            title: const Text('Precios'),
          ): const SizedBox(),
          ListTile(
            leading: const Icon(Icons.logout),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const LogoutAlertWidget(),
              );
            },
            title: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }
}
