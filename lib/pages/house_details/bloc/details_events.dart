import 'package:equatable/equatable.dart';

abstract class DetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadHouse extends DetailsEvent {
  final String id;

  LoadHouse(this.id);

  @override
  List<Object?> get props => [id];
}
