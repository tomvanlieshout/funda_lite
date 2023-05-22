import 'package:equatable/equatable.dart';
import 'package:funda_lite/models/house.dart';

abstract class OverviewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends OverviewState {}

class Loading extends OverviewState {}

class HousesLoaded extends OverviewState {
  final List<House?> houses;

  HousesLoaded(this.houses);

  @override
  List<Object?> get props => [...houses];
}

class ErrorState extends OverviewState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
