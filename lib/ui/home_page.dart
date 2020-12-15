import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:pokemon3_app/bloc/PokemonsBloc.dart';
import 'package:pokemon3_app/bloc/PokemonsEvent.dart';
import 'package:pokemon3_app/bloc/PokemonsState.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';


class HomePage extends StatelessWidget {
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
        if (state is PokemonsInitialState) {
          pokeBloc.add(PokemonsAdd());
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
        pokeBloc.add(PokemonsAdd());
      }
    });
    return ListView.builder(
      itemCount: state.pokemons.length,
      itemBuilder: (BuildContext context, int index) {
        return _listTile( , state.pokemons.length);
      },
    );
  }
  Widget _listTile(List<Type> pokemons, int index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(pokemons[index]),
      trailing: Image(
        //  Map post;
        //    final response = await http.get(url);
      //var url = widget.data["url"];

        // post = json.decode(response.body.toString());
        //  Image.network(post['sprites']['front_default'])

          image: NetworkImage(pokemons[index].url['sprites']['front_default']),
      ),
    );
  }
}