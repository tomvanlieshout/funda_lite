import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funda_lite/models/house.dart';
import 'package:funda_lite/pages/favorites/bloc/favorites_bloc.dart';
import 'package:funda_lite/pages/favorites/bloc/favorites_events.dart';
import 'package:funda_lite/pages/favorites/bloc/favorites_states.dart';

class HouseCard extends StatefulWidget {
  final House house;

  const HouseCard(this.house, {super.key});

  @override
  State<HouseCard> createState() => _HouseCardState();
}

class _HouseCardState extends State<HouseCard> {
  late FavoritesBloc _bloc;
  bool _isFavorited = false;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<FavoritesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    // Before the card is built, check if it occurs in the favorites list. If so, initialise _isFavorited = true
    if (_bloc.state is FavoritesLoaded && (_bloc.state as FavoritesLoaded).favorites.isNotEmpty) {
      if ((_bloc.state as FavoritesLoaded).favorites.where((el) => el!.id == widget.house.id).isNotEmpty) {
        _isFavorited = true;
      }
    }

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
                child: Image.network(widget.house.imageUrl, scale: 2.0),
              ),
              Expanded(child: _buildTextWidgets()),
              _buildButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextWidgets() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.house.address,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
          Text(
            widget.house.postalCode,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
          Text(
            '€${widget.house.price.replaceRange(3, 3, '.')}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
          ),
        ],
      );

  _buildButtons(BuildContext context) => Column(children: [
        IconButton(
          onPressed: _toggleFavorite,
          icon: _isFavorited ? const Icon(Icons.favorite_rounded) : const Icon(Icons.favorite_border_rounded),
          iconSize: 24,
          color: _isFavorited ? Colors.red : Colors.black,
        ),
        IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/house-details-page', arguments: widget.house.id),
            icon: const Icon(Icons.chevron_right_rounded),
            iconSize: 38),
      ]);

  _toggleFavorite() {
    if (_isFavorited) {
      _bloc.add(RemoveFavorite(widget.house));
    } else {
      _bloc.add(AddFavorite(widget.house));
    }
    setState(() => _isFavorited = !_isFavorited);
  }
}
