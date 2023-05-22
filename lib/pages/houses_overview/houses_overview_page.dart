import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funda_lite/models/house.dart';
import 'package:funda_lite/pages/houses_overview/bloc/overview_bloc.dart';
import 'package:funda_lite/pages/houses_overview/bloc/overview_events.dart';
import 'package:funda_lite/pages/houses_overview/bloc/overview_states.dart';
import 'package:funda_lite/widgets/house_card.dart';
import 'package:funda_lite/widgets/error_widget.dart' as funda;

class HousesOverviewPage extends StatefulWidget {
  const HousesOverviewPage({super.key});

  @override
  State<HousesOverviewPage> createState() => _HousesOverviewPageState();
}

class _HousesOverviewPageState extends State<HousesOverviewPage> {
  final TextEditingController _controller = TextEditingController();
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 400));
  late HousesOverviewBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HousesOverviewBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(),
        Flexible(
          child: SingleChildScrollView(
            child: BlocBuilder(
              bloc: _bloc,
              builder: (context, state) {
                if (state is InitialState) _buildWelcomeText();
                if (state is Loading) return const Center(child: CircularProgressIndicator());
                if (state is HousesLoaded) return _buildHousesCards(state.houses);
                if (state is ErrorState) return funda.ErrorWidget(state.message);
                return Container(); // ErrorState
              },
            ),
          ),
        ),
      ],
    );
  }

  _buildTextField() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: const InputDecoration(hintText: 'Fill in a city', border: OutlineInputBorder()),
          controller: _controller,
          onChanged: (value) => _debouncer.run(() {
            _bloc.add(LoadHouses(_controller.text));
          }),
        ),
      );

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

  _buildWelcomeText() => const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Type in the inputfield to start searching...', style: TextStyle(fontSize: 24)),
        ),
      );
}

/* To prevent the onChangeCallback-function from triggering immediately, set a timer
 to delay the callback from executing. */
class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer(this.delay);

  run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() => _timer = null;
}
