import 'package:equatable/equatable.dart';
import 'package:funda_lite/models/house_details.dart';

abstract class DetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends DetailsState {}

class Loading extends DetailsState {}

class HouseLoaded extends DetailsState {
  final HouseDetails house;

  HouseLoaded(this.house);

  @override
  List<Object?> get props => [house];
}

class ErrorState extends DetailsState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
