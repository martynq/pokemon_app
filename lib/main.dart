import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon3_app/bloc/PokemonsBloc.dart';
import 'package:pokemon3_app/ui/home_page.dart';
import 'package:pokemon3_app/data/repository/pokemon_repository.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemons',
      home: BlocProvider(
        builder: (context) => PokemonsBloc(repository: PokemonsRepositoryImpl()),
        child: HomePage(),
      ),
    );
  }
}