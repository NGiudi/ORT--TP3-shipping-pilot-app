import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/index.dart';

import 'package:shipping_pilot/providers/travel_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/pages/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  static const String name = 'EditProfile';

  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends ConsumerState<EditProfilePage> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final User user = ref.watch(travelProdiver)['user'];
    
    final TextEditingController emailController = TextEditingController(text: user.email);
    final TextEditingController lastNameController = TextEditingController(text: user.lastName);
    final TextEditingController nameController = TextEditingController(text: user.name);
    final TextEditingController passwordController = TextEditingController(text: user.password);
    final TextEditingController phoneController = TextEditingController(text: user.phone);
    final TextEditingController roleController = TextEditingController(text: user.role);

    return ScrollableContentWithButtonLayoutPage(
      button: ElevatedButton(
        onPressed: () {},
        child: const Text('Actualizar perfil'),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitleWidget(text: 'Datos personales'),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Nombre',
            ),
          ),
          TextField(
            controller: lastNameController,
            decoration: const InputDecoration(
              labelText: 'Apellido',
            ),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(
              labelText: 'Teléfono',
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              suffixIcon: IconButton(
                icon: Icon(
                  passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
            obscureText: passwordVisible,
          ),
          TextField(
            controller: roleController,
            decoration: const InputDecoration(
              labelText: 'Rol',
            ),
            readOnly: true,
          ),
        ],
      ),
    );
  }
}