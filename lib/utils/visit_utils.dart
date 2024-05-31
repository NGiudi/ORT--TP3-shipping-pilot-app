import 'package:shipping_pilot/models/index.dart';

double calculateVisitPrice(Pricing pricing, String newStatus) {
  switch (newStatus) {
    case Visit.SUCCESSFUL_STATUS:
      return pricing.successfulCoefficient * pricing.visitPrice;
    case Visit.FAILED_STATUS:
      return pricing.failedCoefficient * pricing.visitPrice;
    default:
      return pricing.visitPrice;
  }
}
