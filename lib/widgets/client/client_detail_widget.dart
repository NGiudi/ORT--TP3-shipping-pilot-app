import 'package:flutter/material.dart';

import 'package:shipping_pilot/widgets/widgets.dart';

import 'package:shipping_pilot/models/models.dart';

class ClientDetailWidget extends StatelessWidget {
  final Client client;

  const ClientDetailWidget({
    super.key,
    required this.client,
  });

  @override
  Widget build(BuildContext context) {    
    return Padding(
      padding: const EdgeInsets.only(left: 16), 
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comprador',
            style: Theme.of(context).textTheme.titleLarge
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 12),
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
      ),
    );
  }
}