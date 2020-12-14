import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon3_app/bloc/PokemonsBloc.dart';
import 'package:pokemon3_app/bloc/PokemonsEvent.dart';
import 'package:pokemon3_app/bloc/PokemonsState.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState(); {
  }

}


class _HomePageState extends State<HomePage>{
  PokemonsBloc pokemonsBloc;

  @override
  void initState() {
    super.initState();
    pokemonsBloc = BlocProvider.of<PokemonsBloc>(context);
    pokemonsBloc.add(FetchPokemonsEvent());
  }


@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Builder(
      builder: (context) {
        return Material(
          child: Scaffold(
         appBar: AppBar(
                title: Text("Pokemons"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      pokemonsBloc.add(FetchPokemonsEvent());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                     navigateToAoutPage(context);
                    },
                  )
                ],
              ),
              body: Container(
                child: BlocListener<PokemonsBloc, PokemonsState>(
                  listener: (context, state) {
                    if (state is PokemonErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                     child: BlocBuilder<PokemonsBloc, PokemonsState>(
                        builder: (context, state) {
                           if (state is PokemonsInitialState) {
                              return buildLoading();
                              } else if (state is PokemonsLoadingState) {
                                return buildLoading();
                            } else if (state is PokemonsLoadedState) {
                                return bulidPokemonsList(state.results);
                                      } else if (state is PokemonErrorState) {
                                    return buildErrorUi(state.message);
                           }
                        },
                     ),
                ),
              ),
          ),
        );
      },
    ),
  );

  Widget bulidLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}