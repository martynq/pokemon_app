import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';
import 'package:pokemon3_app/ui/pokemon_list_page.dart';

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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PokemonListPage()));
            //tutaj chcialabym wracac do pierwszej strony, czy to musze jakos umiescic w bloc?
          },
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Image.network(
            '${pokemon.imageUrl}',
            scale: 0.5,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Pokemon name : " + "${pokemon.name}".toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orangeAccent,
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
          ),
          Container(
            height: 80,
            child: Text("Pokemon height: ${pokemon.height}"),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orangeAccent,
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
          ),
          Container(
            child: Text("Pokemon weight: ${pokemon.weight}"),
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orangeAccent,
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
          ),


        ],
      ),
    );
  }
}
