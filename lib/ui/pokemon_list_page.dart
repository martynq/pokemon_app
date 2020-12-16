import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon3_app/bloc/pokemons_bloc.dart';
import 'package:pokemon3_app/bloc/pokemons_event.dart';
import 'package:pokemon3_app/bloc/pokemons_state.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';

class PokemonListPage extends StatefulWidget {
  @override
  PokemonListPageState createState() => PokemonListPageState();
}

class PokemonListPageState extends State<PokemonListPage> {
  PokemonsBloc pokeBloc;

  bool scrollSwitch = true;

  @override
  Widget build(BuildContext context) {
    pokeBloc = BlocProvider.of<PokemonsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Poke App'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<PokemonsBloc, PokemonsState>(
      cubit: pokeBloc,
      builder: (context, state) {
        if (state is PokemonsLoadingState) {
          pokeBloc.add(LoadPokemons());
          return Center(child: CircularProgressIndicator());
        }
        if (state is PokemonsLoadedState) {
          scrollSwitch = true;
          return _list(state);
        }
        return Container();
      },
    );
  }

  Widget _list(PokemonsLoadedState state) {
    return ListView.builder(
      itemCount: state.results.length,
      itemBuilder: (BuildContext context, int index) {
        return _listTile(state.results[index]);
      },
    );
  }

  Widget _listTile(Pokemon pokemon) {
    return ListTile(
    //  onTap: (){
        //TODO
        //open pokemonDetials screen Navigator.of(context).push(PokemonDetailsScreen(pokemon))
      //},
      leading: Icon(Icons.arrow_right),
      title: Text(pokemon.name),
      trailing: Image.network(pokemon.imageUrl),
    );
  }
}
