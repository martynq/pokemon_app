import 'package:pokemon_app/data/model/api_result_model.dart';
import 'package:pokemon_app/data/repository/api_provider.dart';

class PokemonRepository {
  ApiProvider apiProvider = ApiProvider();
  List <Results> pokemons =[];
  int count = 0;

  Future<List<Results>> getPokemons() async {
    if (this.pokemons.isEmpty) {
      this.pokemons.addAll(await apiProvider.fetchPokemons());
      this.count = this.pokemons.lenght;
      return pokemons;
    }
    this.pokemons.addAll(await apiProvider.fetchPokemons(offset:
    this.count));
    this.count = this.pokemons.length;
    return pokemons;
  }}
