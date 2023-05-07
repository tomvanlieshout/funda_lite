import 'package:flutter/material.dart';

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
            _buildTextAndIcon(squareMeters.toString(), Icons.square_foot_rounded),
            _buildTextAndIcon(numberOfBedrooms.toString(), Icons.bedroom_parent_outlined),
            _buildEnegryGradeIcon(energyGrade),
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
            Text(text, style: const TextStyle(fontSize: 16)),
          ],
        ),
      );

  Widget _buildEnegryGradeIcon(String energyGrade) => Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 2.0),
        child: Container(
          width: 32,
          height: 20,
          color: _mapColorToGrade(energyGrade),
          child: Center(
            child: Text(
              energyGrade,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      );

  Color _mapColorToGrade(String energyGrade) {
    switch (energyGrade) {
      case 'A':
        return Colors.green;
      case 'B':
        return Colors.greenAccent;
      case 'C':
        return Colors.lightGreen;
      case 'D':
        return Colors.yellow;
      case 'E':
        return Colors.amber;
      case 'F':
        return Colors.orange;
      case 'G':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
