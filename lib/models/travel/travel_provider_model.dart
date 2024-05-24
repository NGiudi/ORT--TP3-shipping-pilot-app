import 'package:shipping_pilot/models/index.dart';

class TravelProviderModel {  
  final List<Travel> travels;
  final bool isLoading;

  const TravelProviderModel({
    required this.isLoading,
    required this.travels,
  });

  TravelProviderModel copyWith({
    bool? isLoading,
    List<Travel>? travels,
  }) {
    return TravelProviderModel(
      isLoading: isLoading ?? this.isLoading,
      travels: travels ?? List<Travel>.from(this.travels),
    );
  }
}