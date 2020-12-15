
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon3_app/bloc/PokemonsBloc.dart';
import 'package:pokemon3_app/data/repository/pokemon_repository.dart';
import 'package:pokemon3_app/ui/app_ap.dart';


void main() {
  PokemonRepository pokemonRepository = PokemonRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PokemonsBloc>(
        create: (BuildContext context) => PokemonsBloc(pokemonRepository: pokemonRepository),
      )
    ],
    child: MyApp(),
  ));
}