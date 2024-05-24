import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/services/index.dart';

import 'package:shipping_pilot/models/index.dart';

class EditPricingPage extends ConsumerWidget {
  static const String name = 'EditPricing';

  const EditPricingPage({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserProviderModel upm = ref.watch(userProvider);
    Settings? settings = upm.settings;
    
    //TODO: agregar un error de que no se pudo acceder a los datos del precio.
    if (settings == null) {
      return const SizedBox();
    }

    Pricing formPricing = settings.pricing.copyWith();
    
    final formKey = GlobalKey<FormState>();

    return ScrollableContentWithButtonLayoutPage(
      button: ElevatedButton(
        onPressed: () {
          settings.pricing = formPricing;
          
          SettingsService.update(settings);
          ref.read(userProvider.notifier).updateSettings(settings);
        },
        child: const Text('Actualizar precios'),
      ),
      content: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitleWidget(text: 'Precios'),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Pago por visita',
              ),
              initialValue: settings.pricing.visitPrice.toString(),
              onChanged: (value) {
                formPricing.visitPrice = double.parse(value);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Coeficiente de visita fallida',
              ),
              initialValue: settings.pricing.failedCoefficient.toString(),
              onChanged: (value) {
                formPricing.failedCoefficient = double.parse(value);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Coeficiente de visita exitosa',
              ),
              initialValue: settings.pricing.successfulCoefficient.toString(),
              onChanged: (value) {
                formPricing.successfulCoefficient = double.parse(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

