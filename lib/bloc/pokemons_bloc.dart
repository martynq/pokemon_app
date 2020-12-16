import 'package:bloc/bloc.dart';
import 'package:pokemon3_app/bloc/pokemons_event.dart';
import 'package:pokemon3_app/bloc/pokemons_state.dart';
import 'package:pokemon3_app/data/repository/pokemon_repository.dart';

import '../data/model/api_result_model.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final AppService appService = AppService();

  PokemonsBloc() : super(PokemonsLoadingState());

  @override
  Stream<PokemonsState> mapEventToState(
    PokemonsEvent event,
  ) async* {
    if (event is LoadPokemons) {
      try {
        List<Pokemon> results = await appService.getPokemons();
        yield PokemonsLoadedState(results: results);
      } catch (e) {
        yield PokemonErrorState(message: e.toString());
      }
    }
  }
}
