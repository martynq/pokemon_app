import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';

abstract class PokemonsState extends Equatable {
  const PokemonsState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PokemonsLoadingState extends PokemonsState {
  final List<PokemonBase> result = [];
}

class PokemonsLoadedState extends PokemonsState {
  final List<Pokemon> results;
  final int amount;
  final String name;
  final String imageUrl;
  final String weight;
  final String size;
  final String height;

  PokemonsLoadedState({
    this.results,
    this.amount,
    this.imageUrl,
    this.name,
    this.weight,
    this.size,
    this.height,
  });

  PokemonsLoadedState copyWith({
    List<Pokemon> results,
    int amount,
  }) {
    return PokemonsLoadedState(
        results: results ?? this.results,
        amount: amount ?? this.amount,
        name: name ?? name,
        imageUrl: imageUrl ?? imageUrl,
        weight: weight ?? weight,
        size: size ?? size,
        height: height ?? height);
  }

  @override
  // TODO: implement props
  List<Object> get props => [results];
}

class PokemonErrorState extends PokemonsState {
  final String message;

  PokemonErrorState({this.message});
}
