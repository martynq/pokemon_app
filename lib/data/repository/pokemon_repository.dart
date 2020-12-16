import 'dart:convert';
import 'package:http/http.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';

class AppService {

  final Client _app = Client();
  List<PokemonBase> pokemons = [];
  static String pokemonUrl = "https://pokeapi.co/api/v2/pokemon/?limit=10";

  Future<List<Pokemon>> getPokemons() async {
    final response = await _app.get(pokemonUrl);
    if (response.statusCode == 200) {
      var pokemons = [];
      var data = PokemonListResult.fromJson(json.decode(response.body)).basePokemons;

      data.forEach((element) async {
        var pokemon = await getSinglePokemon(element.url);

        pokemons.add(pokemon);
      });

      return pokemons;
    } else {
      throw Exception("Error");
    }
  }

  Future<Pokemon> getSinglePokemon(String url) async{
    final response = await _app.get(PokemonBase(url: url));
    if (response.statusCode == 200) {
      var data1 = Pokemon.fromJson(json.decode(response.body));

      return Pokemon(imageUrl: data1.imageUrl);
    }
  }
}