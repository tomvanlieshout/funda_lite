import 'package:flutter/material.dart';
import 'package:funda_lite/widgets/energy_grade.dart';

class MainInfoSection extends StatelessWidget {
  final String address;
  final String postalCode;
  final String city;
  final String price;
  final int squareMeters;
  final int numberOfBedrooms;
  final String energyGrade;

  const MainInfoSection({
    required this.address,
    required this.postalCode,
    required this.city,
    required this.price,
    required this.squareMeters,
    required this.numberOfBedrooms,
    required this.energyGrade,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(address),
        Row(
          children: [
            _buildSecondary(postalCode),
            _buildSecondary(city),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(price, style: const TextStyle(fontSize: 16)),
            ),
            _buildTextAndIcon('${squareMeters.toString()}m²', Icons.square_foot_rounded),
            _buildTextAndIcon(numberOfBedrooms.toString(), Icons.bedroom_parent_outlined),
            EnergyGrade(energyGrade),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(String text) => Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      );

  Widget _buildSecondary(String text) => Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 2.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w300),
        ),
      );

  Widget _buildTextAndIcon(String text, IconData icon) => Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(text, style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
      );
}
