import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funda_lite/api/service.dart';
import 'package:funda_lite/pages/house_details/bloc/details_events.dart';
import 'package:funda_lite/pages/house_details/bloc/details_states.dart';

class HouseDetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final Service _service;

  HouseDetailsBloc()
      : _service = const Service(),
        super(InitialState()) {
    on<LoadHouse>(_handleLoadHouse);
  }

  _handleLoadHouse(LoadHouse event, Emitter emit) async {
    try {
      emit(Loading());
      final houseDetails = await _service.getHouseById(event.id);
      emit(HouseLoaded(houseDetails));
    } on FundaError catch (e) {
      emit(ErrorState(e.message));
    }
  }
}
