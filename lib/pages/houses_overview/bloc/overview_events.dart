import 'package:equatable/equatable.dart';

abstract class OverviewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadHouses extends OverviewEvent {
  final String city;

  LoadHouses(this.city);

  @override
  List<Object?> get props => [city];
}
