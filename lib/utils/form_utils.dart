String? doubleFormValidation(value) {
  if (value == null || value.isEmpty) {
    return 'Campo requerido.';
  } else if (double.tryParse(value) == null) {
    return 'Ingrese un número válido.';
  } else if (double.parse(value) <= 0) {
    return 'Ingre un múmero mayor a 0.';
  }

  return null;
}