
import 'dart:convert';
import 'package:http/http.dart';
import 'package:pokemon3_app/data/model/api_result_model.dart';

class AppService {

  final Client _app = Client();
  List<Results> pokemons = [];
  static String PokemonUrl = "https://pokeapi.co/api/v2/pokemon/?limit=10";

  Future<List<Results>> getPokemons() async {
    final response = await _app.get(PokemonUrl);
    if (response.statusCode == 200) {
      var data = Pokemons.fromJson(json.decode(response.body));
      return json.decode(response.body);

    } else {
      throw Exception("Error");
    }
  }}
