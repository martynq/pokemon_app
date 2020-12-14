import 'package:pokemon3_app/data/model/api_result_model.dart';
import 'package:pokemon3_app/data/repository/api_helper.dart';



class ApiProvider {
  AppHelper _helper = AppHelper();
  Future<List<Results>> fetchPokemons({int offset = 0}) async {
    final path = 'pokemon/?offset=20&limit=10';
    final responseString = await _helper.get(path);
    final response = Pokemons.fromJson(responseString).results;
    return response;
  }
}