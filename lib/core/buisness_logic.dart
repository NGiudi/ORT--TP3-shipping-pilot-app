import 'package:shipping_pilot/models/index.dart';

class BuisnessLogic {
  static double calculateVisitPrice(String visitStauts, Pricing pricing) {
    switch (visitStauts) {
      case Visit.SUCCESSFUL_STATUS:
        return pricing.successfulCoefficient * pricing.visitPrice;
      case Visit.FAILED_STATUS:
        return pricing.failedCoefficient * pricing.visitPrice;
      default:
        return pricing.visitPrice;
    }
  }
}