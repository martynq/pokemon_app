import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:pokemon3_app/bloc/PokemonsEvent.dart';
import 'package:pokemon3_app/bloc/PokemonsState.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';
import 'package:pokemon3_app/data/repository/pokemon_repository.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {

  PokemonsRepository repository;

  PokemonsBloc({@required this.repository});


  PokemonsState get initialState => PokemonsInitialState();

  @override
  Stream<PokemonsState> mapEventToState(PokemonsEvent event) async* {
    if (event is FetchPokemonsEvent) {
      yield PokemonsLoadingState();
      try {
        List<Results> results = await repository.getPokemons();
        yield PokemonsLoadedState(results: results);
      } catch (e) {
        yield PokemonErrorState(message: e.toString());
      }
    }
  }

}