import 'dart:convert';
import 'package:pokemon3_app/data/model/api_result_model.dart';
import 'package:pokemon3_app/res/startings.dart';

abstract class PokemonsRepository {
  Future<List<Results>> getPokemons();
}

class PokemonsRepositoryImpl implements PokemonsRepository {
  get http => null;



  @override
  Future<List<Results>> getPokemons() async {
    var response = await http.get(AppStrings.PokemonUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Results> results = Pokemons.fromJson(data).results;
      return results;
    } else {
      throw Exception();
    }
  }

}