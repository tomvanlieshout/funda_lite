import 'package:equatable/equatable.dart';
import 'package:funda_lite/models/house.dart';

abstract class State extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends State {}

class Loading extends State {}

class HousesLoaded extends State {
  final List<House?> houses;

  HousesLoaded(this.houses);

  @override
  List<Object?> get props => [...houses];
}

class FavoritesLoaded extends State {
  final List<House?> favorites;

  FavoritesLoaded(this.favorites);

  @override
  List<Object?> get props => [...favorites];
}

class ErrorState extends State {
  final String message;
  final int errorCode;

  ErrorState(this.message, this.errorCode);

  @override
  List<Object?> get props => [message, errorCode];
}
