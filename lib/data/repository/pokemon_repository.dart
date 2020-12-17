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
      List<Pokemon> pokemons = [];
      var data = PokemonListResult.fromJson(
        json.decode(response.body),
      ).basePokemons;

      data.forEach((element) async {
        var pokemon = await getSinglePokemon(element.url);

        pokemons.add(pokemon);
      });

      return Future.value(pokemons);
    } else {
      throw Exception("Error");
    }
  }

  Future<Pokemon> getSinglePokemon(String url) async {
    try {
      final response = await _app.get(url);

    print('bazinga response: $response');
    if (response.statusCode == 200) {
      var data1 = Pokemon.fromJson(json.decode(response.body));

      return Future.value(Pokemon(imageUrl: data1.imageUrl));
    } else {
      throw Exception("Error");
    }
    }catch(e){
      print('bazinga error: ${e.toString()}');
    }
  }
}
