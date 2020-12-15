import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';


abstract class PokemonsEvent extends Equatable{}

@override
// TODO: implement props
List<Object> get props => null;

class PokemonsAdd extends PokemonsEvent {
  @override
  // TODO: implement props

  List<Object> get props => null;
}
class LoadPokemonDetail extends PokemonsEvent {
  final String url;

  LoadPokemonDetail({@required this.url});

  @override
  List<Object> get props => [url];

}