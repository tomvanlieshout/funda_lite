import 'package:flutter/material.dart';

class SpecificationsSection extends StatelessWidget {
  final String price;
  final String pricePerSqMeter;
  final String squareMeters;
  final String bedrooms;
  final Widget energyGrade;
  final String constructionYear;
  final String houseType;

  const SpecificationsSection({
    super.key,
    required this.price,
    required this.pricePerSqMeter,
    required this.squareMeters,
    required this.bedrooms,
    required this.energyGrade,
    required this.constructionYear,
    required this.houseType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price
        const Divider(),
        const Text('Vraagprijs', style: title),
        Text('$price kosten koper'),

        // Price per sq. meter
        const Divider(),
        const Text('Vraagprijs per m²', style: title),
        Text(pricePerSqMeter),

        // Square meters
        const Divider(),
        const Text('Gebruiksoppervlakte', style: title),
        Text('${squareMeters}m²'),

        // No. of bedrooms
        const Divider(),
        const Text('Aantal slaapkamers', style: title),
        Text(bedrooms),

        // Energy grade
        const Divider(),
        const Text('Energielabel', style: title),
        energyGrade,

        // Construction year
        const Divider(),
        const Text('Bouwjaar', style: title),
        Text(constructionYear),

        // Type of house
        const Divider(),
        const Text('Soort woning', style: title),
        Text(houseType.replaceFirst(houseType[0], houseType[0].toUpperCase())), // capitalize first letter
        const Divider(),
      ],
    );
  }

  static const TextStyle title = TextStyle(fontSize: 13, color: Colors.black54);
}
