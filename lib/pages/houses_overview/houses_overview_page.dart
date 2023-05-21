import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funda_lite/models/house.dart';
import 'package:funda_lite/pages/houses_overview/bloc/overview_bloc.dart';
import 'package:funda_lite/pages/houses_overview/bloc/overview_events.dart';
import 'package:funda_lite/pages/houses_overview/bloc/overview_states.dart' as bloc;
import 'package:funda_lite/widgets/house_card.dart';

class HousesOverviewPage extends StatefulWidget {
  const HousesOverviewPage({super.key});

  @override
  State<HousesOverviewPage> createState() => _HousesOverviewPageState();
}

class _HousesOverviewPageState extends State<HousesOverviewPage> {
  late HousesOverviewBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HousesOverviewBloc>(context);
    _bloc.add(LoadHouses('Nijmegen'));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Funda Lite',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            if (state is bloc.InitialState) return Container();
            if (state is bloc.Loading) return const Center(child: CircularProgressIndicator());
            if (state is bloc.HousesLoaded) return _buildHousesCards(state.houses);
            return Container(); // ErrorState
          },
        ),
      ),
    );
  }

  _buildHousesCards(List<House?> houses) {
    final children = <Widget>[];
    if (houses.isNotEmpty) {
      children.addAll(houses.map((house) => HouseCard(house!)).toList());
    }
    return Center(
      child: Column(
        children: children,
      ),
    );
  }
}
