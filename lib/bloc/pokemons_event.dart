import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class PokemonsEvent extends Equatable {}

@override
List<Object> get props => null;

class LoadPokemons extends PokemonsEvent {
  @override
  List<Object> get props => [];
}

class LoadPokemonDetail extends PokemonsEvent {
  final String url;

  LoadPokemonDetail({@required this.url});

  @override
  List<Object> get props => [url];
}
