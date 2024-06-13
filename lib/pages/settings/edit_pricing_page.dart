import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipping_pilot/providers/index.dart';

import 'package:shipping_pilot/widgets/index.dart';
import 'package:shipping_pilot/pages/index.dart';

import 'package:shipping_pilot/services/index.dart';
import 'package:shipping_pilot/utils/index.dart';

import 'package:shipping_pilot/models/index.dart';

class EditPricingPage extends ConsumerWidget {
  static const String name = 'EditPricing';

  const EditPricingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserProviderModel upm = ref.watch(userProvider);
    Settings? settings = upm.settings;

    if (settings == null) {
      return const SettingsErrorPriceWidget();
    }

    Pricing formPricing = settings.pricing.copyWith();

    final formKey = GlobalKey<FormState>();

    return ScrollableContentWithButtonLayoutPage(
      button: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            settings.pricing = formPricing;

            try {
              SettingsService.update(settings);
              ref.read(userProvider.notifier).updateSettings(settings);

              CustomSnackbar.showSuccessSnackbar(
                  context, 'Precios actualizados exitosamente.');
            } catch (err) {
              CustomSnackbar.showErrorSnackbar(
                  context, 'Hubo un problema al actualizar los precios.');
            }
          }
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
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                if (double.tryParse(value) != null) {
                  formPricing.visitPrice = double.parse(value);
                }
              },
              validator: (String? value) {
                return doubleFormValidation(value);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Coeficiente de visita fallida',
              ),
              initialValue: settings.pricing.failedCoefficient.toString(),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                if (double.tryParse(value) != null) {
                  formPricing.failedCoefficient = double.parse(value);
                }
              },
              validator: (String? value) {
                return doubleFormValidation(value);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Coeficiente de visita exitosa',
              ),
              initialValue: settings.pricing.successfulCoefficient.toString(),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                if (double.tryParse(value) != null) {
                  formPricing.successfulCoefficient = double.parse(value);
                }
              },
              validator: (String? value) {
                return doubleFormValidation(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
