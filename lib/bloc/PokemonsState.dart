import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';

abstract class PokemonsState extends Equatable {
  const PokemonsState();
}

class PokemonsInitialState extends PokemonsState {
  final List<Results> pokemons = [];

  @override

  List<Object> get props => [pokemons];
}
class PokemonsLoadedState extends PokemonsState {

  final List <Results> pokemons;
  final int amount;

  PokemonsLoadedState({@required this.pokemons, @required this.amount});


  @override
  List<Object> get props => [this.pokemons, this.amount];
}
