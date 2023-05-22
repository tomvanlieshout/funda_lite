import 'package:equatable/equatable.dart';
import 'package:funda_lite/models/house.dart';

abstract class FavoritesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<House?> favorites;

  FavoritesLoaded(this.favorites);

  @override
  List<Object?> get props => [...favorites];
}
