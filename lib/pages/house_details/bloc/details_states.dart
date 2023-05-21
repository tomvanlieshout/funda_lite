import 'package:equatable/equatable.dart';
import 'package:funda_lite/models/house_details.dart';

abstract class State extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends State {}

class Loading extends State {}

class HouseLoaded extends State {
  final HouseDetails house;

  HouseLoaded(this.house);

  @override
  List<Object?> get props => [house];
}

class ErrorState extends State {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
