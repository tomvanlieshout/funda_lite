import 'package:equatable/equatable.dart';
import 'package:funda_lite/models/house.dart';

abstract class FavoritesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFavorites extends FavoritesEvent {}

class AddFavorite extends FavoritesEvent {
  final House house;

  AddFavorite(this.house);

  @override
  List<Object?> get props => [house];
}

class RemoveFavorite extends FavoritesEvent {
  final House house;

  RemoveFavorite(this.house);

  @override
  List<Object?> get props => [house];
}
