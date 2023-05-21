import 'package:equatable/equatable.dart';

abstract class Event extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadHouses extends Event {
  final String city;

  LoadHouses(this.city);

  @override
  List<Object?> get props => [city];
}

class LoadFavorites extends Event {}

class AddFavorite extends Event {
  final String id;

  AddFavorite(this.id);

  @override
  List<Object?> get props => [id];
}

class RemoveFavorite extends Event {
  final String id;

  RemoveFavorite(this.id);

  @override
  List<Object?> get props => [id];
}
