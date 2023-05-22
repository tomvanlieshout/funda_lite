import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funda_lite/api/service.dart';
import 'package:funda_lite/pages/houses_overview/bloc/overview_events.dart';
import 'package:funda_lite/pages/houses_overview/bloc/overview_states.dart';

class HousesOverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  final Service _service;

  HousesOverviewBloc()
      : _service = const Service(),
        super(InitialState()) {
    on<LoadHouses>(_handleLoadHouses);
  }

  void _handleLoadHouses(LoadHouses event, Emitter emit) async {
    try {
      emit(Loading());
      final houses = await _service.getHousesByCity(event.city);
      emit(HousesLoaded(houses));
    } on FundaError catch (e) {
      emit(ErrorState(e.message));
    }
  }
}
