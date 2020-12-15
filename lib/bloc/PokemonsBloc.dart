import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pokemon3_app/bloc/PokemonsEvent.dart';
import 'package:pokemon3_app/bloc/PokemonsState.dart';
import 'package:pokemon3_app/data/repository/pokemon_repository.dart';


class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
 final AppService appService;

  PokemonsBloc({@required this.appService});


  PokemonsState get initialState => PokemonsLoadingState();


  @override
  Stream<PokemonsState> mapEventToState(
      PokemonsEvent event,
      ) async* {
    if (event is PokemonsAdd) {
      try {

        List<Results> results = await appService.getPokemons();
        yield PokemonsLoadedState(results: results);
      } catch (e) {
        yield PokemonErrorState(message: e.toString());
      }
    }
 }


}