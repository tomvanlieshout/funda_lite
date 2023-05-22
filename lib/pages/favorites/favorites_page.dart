import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funda_lite/models/house.dart';
import 'package:funda_lite/pages/favorites/bloc/favorites_bloc.dart';
import 'package:funda_lite/pages/favorites/bloc/favorites_events.dart';
import 'package:funda_lite/pages/favorites/bloc/favorites_states.dart';
import 'package:funda_lite/widgets/house_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<FavoritesBloc>(context);
    _bloc.add(LoadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is FavoritesLoaded && state.favorites.isNotEmpty) {
          return _buildFavorites(state.favorites);
        } else {
          return _buildEmptyWidget();
        }
      },
    );
  }

  _buildFavorites(List<House?> favorites) {
    List<Widget> children = favorites.map((house) => HouseCard(house!)).toList();

    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }

  _buildEmptyWidget() => const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'You have not selected any favorites yet.',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
}
