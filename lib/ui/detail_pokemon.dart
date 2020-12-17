import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';
import 'package:pokemon3_app/ui/pokemon_list_page.dart';

class PokemonDetailsScreen extends StatelessWidget {
final Pokemon pokemon;

  const PokemonDetailsScreen({Key key, @required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PokemonListPage()));
          },),),
    body: Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
    SizedBox(height: 20),
    Text("Pokemon name : ${pokemon.name}"),
    SizedBox(height: 8),
    Text("Pokemon height: ${pokemon.height}"),
    SizedBox(height: 8),
    Text("Pokemon weight: ${pokemon.weight}"), ], ), ), ); } }


