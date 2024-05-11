import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/index.dart';

import 'package:shipping_pilot/providers/travel_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shipping_pilot/pages/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

import 'package:shipping_pilot/services/api/user_service.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  static const String name = 'EditProfile';

  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

//TODO: agregar snackbar y validacioens en el formulario.
class EditProfilePageState extends ConsumerState<EditProfilePage> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final User user = ref.watch(travelProdiver)['user'];
    User formUser = user.copyWith();

    final formKey = GlobalKey<FormState>();

    return ScrollableContentWithButtonLayoutPage(
      button: ElevatedButton(
        onPressed: () {
          UserService.update(formUser);
          ref.read(travelProdiver.notifier).updateLoggedUser(formUser);
        },
        child: const Text('Actualizar perfil'),
      ),
      content: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitleWidget(text: 'Datos personales'),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nombre',
              ),
              initialValue: user.name,
              onChanged: (value) {
                formUser.name = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Apellido',
              ),
              initialValue: user.lastName,
              onChanged: (value) {
                formUser.lastName = value;
              },
            ),
            TextFormField(
              initialValue: user.docNumber.toString(),
              decoration: const InputDecoration(
                labelText: 'DNI',
              ),
              readOnly: true,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              initialValue: user.email,
              onChanged: (value) {
                formUser.email = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Teléfono',
              ),
              initialValue: user.phone,
              onChanged: (value) {
                formUser.name = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off
                  )
                  ,
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
              initialValue: user.password,
              obscureText: passwordVisible,
              onChanged: (value) {
                formUser.password = value;
              },
            ),
            TextFormField(
              initialValue: user.role,
              decoration: const InputDecoration(
                labelText: 'Rol',
              ),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}