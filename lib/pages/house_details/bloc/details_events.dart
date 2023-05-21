import 'package:equatable/equatable.dart';

abstract class Event extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadHouse extends Event {
  final String id;

  LoadHouse(this.id);

  @override
  List<Object?> get props => [id];
}

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
