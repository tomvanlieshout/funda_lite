import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funda_lite/models/house.dart';
import 'package:funda_lite/pages/favorites/bloc/favorites_events.dart';
import 'package:funda_lite/pages/favorites/bloc/favorites_states.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final favorites = <House?>[];

  FavoritesBloc() : super(InitialState()) {
    on<LoadFavorites>(_handleLoadFavorites);
    on<AddFavorite>(_handleAddFavorite);
    on<RemoveFavorite>(_handleRemoveFavorite);
  }

  _handleLoadFavorites(LoadFavorites event, Emitter emit) async => emit(FavoritesLoaded([...favorites]));

  _handleAddFavorite(AddFavorite event, Emitter emit) async {
    if (!favorites.contains(event.house)) {
      favorites.add(event.house);
      add(LoadFavorites());
    }
  }

  _handleRemoveFavorite(RemoveFavorite event, Emitter emit) async {
    favorites.removeWhere((element) => element?.id == event.house.id);
    add(LoadFavorites());
  }
}
