import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';
import 'package:pokemon3_app/ui/pokemon_list_page.dart';
import 'package:pokemon3_app/widget/pokemon_feature.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsScreen({Key key, @required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          pokemon.name.toUpperCase(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => PokemonListPage()));
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Image.network(
              '${pokemon.imageUrl}',
              scale: 0.5,
            ),
          ),
          SizedBox.shrink(),
          Wrap(
            children: [
              PokemonFeature(pokemonFeature: "Pokemon height: " + "${pokemon.height * 10} cm"),
              PokemonFeature(pokemonFeature: "Pokemon weight: ${(pokemon.weight * 0.1).round()} kg"),
              PokemonFeature(pokemonFeature: "Pokemon Id: ${pokemon.id}"),
              PokemonFeature(pokemonFeature: "Pokemon order: ${pokemon.order}"),
            ],
          ),
        ],
      ),
    );
  }
}
