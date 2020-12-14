import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pokemon3_app/bloc/PokemonsEvent.dart';
import 'package:pokemon3_app/bloc/PokemonsState.dart';
import 'package:pokemon3_app/data/repository/pokemon_repository.dart';
import 'package:pokemon3_app/data/repository/api_provider.dart.dart';



class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  PokemonRepository pokemonRepository;

  PokemonsBloc({@required this.pokemonRepository})
      : assert(pokemonRepository != null);
  @override
  PokemonsState get initialState => PokemonsInitialState();
  @override
  Stream<PokemonsState> mapEventToState(
      PokemonsEvent event,
      ) async* {
    if (event is PokemonsAdd) {
      try {
        final pokemons = await this.pokemonRepository.fetchPokemons();
        yield (PokemonsLoadedState(pokemons: pokemons, amount: pokemons.length));
      } catch (error) {
        print(error);
      }
    }
  }
}