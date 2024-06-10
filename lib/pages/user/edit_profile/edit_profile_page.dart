import 'package:flutter/material.dart';
import 'package:shipping_pilot/models/index.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/pages/index.dart';
import 'package:shipping_pilot/widgets/index.dart';

import 'package:shipping_pilot/services/api/user_service.dart';

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
    UserProviderModel upm = ref.watch(userProvider);
    
    if (upm.user == null) {
      return const SizedBox();
    } 
    
    User formUser = upm.user!.copyWith();

    final formKey = GlobalKey<FormState>();

    return ScrollableContentWithButtonLayoutPage(
      button: ElevatedButton(
        onPressed: () {
          try {
            UserService.update(formUser);
            ref.read(userProvider.notifier).updateLoggedUser(formUser);
            
            CustomSnackbar.showSuccessSnackbar(context, 'Datos actualizados exitosamente.');
          } catch (err) {
            CustomSnackbar.showErrorSnackbar(context, 'Hubo un problema al actualizar los datos.');
          }
          
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
              initialValue: upm.user!.name,
              onChanged: (value) {
                formUser.name = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Apellido',
              ),
              initialValue: upm.user!.lastName,
              onChanged: (value) {
                formUser.lastName = value;
              },
            ),
            TextFormField(
              initialValue: upm.user!.docNumber.toString(),
              decoration: const InputDecoration(
                labelText: 'DNI',
              ),
              readOnly: true,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              initialValue: upm.user!.email,
              onChanged: (value) {
                formUser.email = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Teléfono',
              ),
              initialValue: upm.user!.phone,
              onChanged: (value) {
                formUser.name = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
              initialValue: upm.user!.password,
              obscureText: passwordVisible,
              onChanged: (value) {
                formUser.password = value;
              },
            ),
            TextFormField(
              initialValue: upm.user!.role,
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
