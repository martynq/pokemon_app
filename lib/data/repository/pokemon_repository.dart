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
      //tu do konca nie rozumiem dlaczego mamy .basePokemons, czy to oznacza ze mamy PokemonListResults klase i uywajac url po jej rozkodowaniu z json
      //mozemy odniesc to do klasy/elementow z klasy BasePOkemon?

      return Future.value(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<Pokemon> getSinglePokemon(String url) async {
    // tworzymy metode getSinglePokemon ktora jest asynchroniczna tzn ze pozwala operacja zachodzic podczas gdy ona wciaz moze dzialac
    final response = await _app.get(url);
// do zmiennej response przypisujemy  pobieranie danych z url (await dziala tylko w funkcjach async)
    if (response.statusCode == 200) {
      //jezeli status code response jest rowny 200 tzn ze wszystko jest ok i ..
      var data1 = Pokemon.fromJson(json.decode(response.body));
//do zmiennej data1 przypisujemy wartosci/elementy z modelu Pokemon pobrane z url
      return Future.value(data1);
      //zwracamy te wartosci(data1)
    } else {
      throw Exception("Error");
    }
  }
}
