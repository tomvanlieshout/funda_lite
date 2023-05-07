import 'package:flutter/material.dart';

class EnergyGrade extends StatelessWidget {
  final String grade;
  final EdgeInsetsGeometry padding;

  const EnergyGrade(this.grade, {this.padding = const EdgeInsets.only(left: 8.0, top: 2.0), super.key});

  @override
  Widget build(BuildContext context) {
    return _buildEnegryGradeIcon();
  }

  Widget _buildEnegryGradeIcon() => Padding(
        padding: padding,
        child: Container(
          width: 32,
          height: 20,
          color: _mapColorToGrade(),
          child: Center(
            child: Text(
              grade,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _mapTextColorToGrade()),
            ),
          ),
        ),
      );

  Color _mapColorToGrade() {
    switch (grade) {
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

  Color _mapTextColorToGrade() => grade == 'B' || grade == 'C' || grade == 'D' ? Colors.black : Colors.white;
}
