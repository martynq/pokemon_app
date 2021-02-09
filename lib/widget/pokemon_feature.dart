import 'package:flutter/material.dart';

class PokemonFeature extends StatelessWidget {
  final String pokemonFeature;

  const PokemonFeature({Key key, this.pokemonFeature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      alignment: Alignment.center,
      child: Text(
        "$pokemonFeature",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white70,
      ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
    );
  }
}
