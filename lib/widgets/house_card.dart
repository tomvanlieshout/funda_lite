import 'package:flutter/material.dart';
import 'package:funda_lite/models/house.dart';

class HouseCard extends StatelessWidget {
  final House house;

  const HouseCard(this.house, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      elevation: 4,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Image.network(house.imageUrl, scale: 2.0),
              ),
              Expanded(child: _buildText()),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  _buildText() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(house.address, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), overflow: TextOverflow.fade, maxLines: 1, softWrap: false),
          Text(
            house.postalCode,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
          Text(
            '€${house.price.replaceRange(3, 3, '.')}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
        ],
      );

  // TODO implement onPressed-handlers
  _buildButtons() => Column(children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border_rounded), iconSize: 24),
        IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right_rounded), iconSize: 38),
      ]);
}
