import 'package:equatable/equatable.dart';

class House extends Equatable {
  final String address;
  final String postalCode;
  final String price;
  final String bedrooms;

  const House({
    required this.address,
    required this.postalCode,
    required this.price,
    required this.bedrooms,
  });

  @override
  List<Object?> get props => [address, postalCode, price, bedrooms];
}
