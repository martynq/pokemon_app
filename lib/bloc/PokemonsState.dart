import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';

abstract class PokemonsState extends Equatable {
  const PokemonsState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PokemonsLoadingState extends PokemonsState {
final List<Results> result = [];
}

class PokemonsLoadedState extends PokemonsState {
  final List<Results> results;
  final int amount;

  PokemonsLoadedState({this.results, this.amount});

  PokemonsLoadedState copyWith({
  List<Results> results,
    int amount,

}) {
    return PokemonsLoadedState(
        results: results ?? this.results,
    amount: amount ?? this.amount);

  }


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