import 'package:flutter/material.dart';

import 'package:shipping_pilot/widgets/index.dart';

import 'package:shipping_pilot/models/index.dart';

class ClientDetailWidget extends StatelessWidget {
  final Client client;

  const ClientDetailWidget({ super.key, required this.client });

  @override
  Widget build(BuildContext context) {    
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(text: 'Comprador'),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldWidget(
                title: 'Nombre y Apellido',
                text: client.fullName(),
              ),
              const SizedBox(height: 8),
              FieldWidget(
                title: 'Dirección',
                text: client.address.fullAddress(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  client.address.district,
                  style: Theme.of(context).textTheme.bodyMedium
                ),
              ),
              const SizedBox(height: 8),
              FieldWidget(
                title: 'Teléfono',
                text: client.phone,
              ),
              const SizedBox(height: 8),
              FieldWidget(
                title: 'Observaciones',
                text: client.address.observations.isEmpty ? '-' : client.address.observations,
              ),
            ],
          ),
        ),
      ],
    );
  }
}