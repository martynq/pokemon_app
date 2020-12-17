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
        List<PokemonBase> data = await appService.getPokemons();
//jezeli event to LoadPokemons spróbuj pobrac liste elementow z modelu pokemonBase z uzyciem metody getPokemons z klasy appService, liste elemntow przypisz do zmiennej data
        final toFetch = List.of(data);
        // do zmiennej toFetch przypisz utworzona za pomoca metody List.of liste z elementow z data
        List<Pokemon> results = [];
        //stworz pusta liste elemetow pod zmienna results
        print('bazinga data.first.url: ${data.first.url}');
//drukuj 'bazinga data.first.url: ${data.first.url}'
        for (var i = 0; i < toFetch.length; i++) {
          // dla var i rownej 0 i mneijszej niz dlugosc listy (ilosc elemtow) w toFech, i zwieksza sie o jeden za kazdym razem
          Pokemon pokemon = await appService.getSinglePokemon(toFetch[i].url);
      //    do wasrtowisci pokemon przypisujemy wartosc url z uzyciem metody getSinglePokemon z klasy appsrevice, tutaj wykorzystujemy url ktory dla kazdego pokemona jest innt z listy tofetch[w nawiasie mamy indeks ktory odpowiada iteracji zgodnie z wartoscia i w petli
          results.add(pokemon);
    //      dodajemy koleny element do wcezsniej utworzonej pustej listy results
        }

        yield PokemonsLoadedState(results: results);
      } catch (e) {
        yield PokemonErrorState(message: e.toString());
      }
    }
  }
}
