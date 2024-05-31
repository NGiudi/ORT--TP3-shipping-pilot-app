import 'package:shipping_pilot/models/index.dart';

String? doubleFormValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo requerido.';
  } else if (double.tryParse(value) == null) {
    return 'Ingrese un número válido.';
  } else if (double.parse(value) <= 0) {
    return 'Ingre un múmero mayor a 0.';
  }

  return null;
}

String? docNumberFormValidation(String? value) {
  if (value == null) {
    return 'Campo requerido.';
  } else if (value.length != 8) {
    return 'Este campo debe tener 8 dígitos.';
  } else if (int.parse(value) <= 0) {
    return 'Campo inválido.';
  }

  return null;
}

String? textFormValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo requerido.';
  }

  return null;
}


String? secureCodeFormValidation(Visit visit, String? value) {
  if (visit.hasSecureCode()) {
    if (value == null || value.isEmpty) {
      return 'Campo requerido.';
    } else if (visit.secureCode != value) {
      return 'Código de seguridad inválido';
    }
  }
  
  return null;
}