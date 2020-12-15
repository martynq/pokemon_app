import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:pokemon3_app/bloc/PokemonsBloc.dart';
import 'package:pokemon3_app/bloc/PokemonsState.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';
import 'package:pokemon3_app/data/repository/pokemon_repository.dart';

import 'detail_pokemon.dart';

class ListPokemonPage extends StatefulWidget {
  @override
  ListPokemonPageState createState() => ListPokemonPageState();
}

class ListPokemonPageState extends State<ListPokemonPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 10.0;

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
      bloc: pokeBloc,
      builder: (context, state) {
        if (state is PokemonsLoadingState) {
          pokeBloc.add(getPokemons());
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
    final scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          scrollSwitch == true) {
        scrollSwitch = false;
        pokeBloc.add(getPokemons());
      }
    });
return ListView.builder(
      controller: scrollController,
      itemCount: state.results.length,
      itemBuilder: (BuildContext context, int index) {
        return _listTile(state.results, index);
      },
    );
  }
Widget _listTile(List<Results> pokemons, int index) {
    final chunks = pokemons[index].url.split('/');
    var id = chunks[6];
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(pokemons[index].name),
      trailing: Image(
        image: NetworkImage('${pokemons[index].url}'),
      ),
    );
  }
}