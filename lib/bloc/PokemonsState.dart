import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';

abstract class PokemonsState extends Equatable {}

class PokemonsInitialState extends PokemonsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PokemonsLoadingState extends PokemonsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PokemonsLoadedState extends PokemonsState {

  List <Results> results;

  PokemonsLoadedState({@required this.results});

  @override
  // TODO: implement props
  List<Object> get props => [results];
}

class PokemonErrorState extends PokemonsState {

  String message;

  PokemonErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}