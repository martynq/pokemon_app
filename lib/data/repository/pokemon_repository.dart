import 'dart:convert';
import 'package:http/http.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';

class AppService {
  final Client _app = Client();
  List<PokemonBase> pokemons = [];
  static String pokemonUrl = "https://pokeapi.co/api/v2/pokemon/?limit=10";

  Future<List<PokemonBase>> getPokemons() async {
    final response = await _app.get(pokemonUrl);
    if (response.statusCode == 200) {
      List<PokemonBase> data = PokemonListResult.fromJson(
        json.decode(response.body),
      ).basePokemons;
      return Future.value(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<Pokemon> getSinglePokemon(String url) async {
    final response = await _app.get(url);
    if (response.statusCode == 200) {
      var data1 = Pokemon.fromJson(json.decode(response.body));
      return Future.value(data1);
    } else {
      throw Exception("Error");
    }
  }
}
