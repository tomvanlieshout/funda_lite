import 'package:equatable/equatable.dart';

class House extends Equatable {
  final String address;
  final String postalCode;
  final String price;
  final String bedrooms;
  final String imageUrl;

  const House({
    required this.address,
    required this.postalCode,
    required this.price,
    required this.bedrooms,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [address, postalCode, price, bedrooms, imageUrl];
}
