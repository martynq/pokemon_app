class PokemonListResult {
  int count;
  String next;
  Null previous;
  List<PokemonBase> basePokemons;

  PokemonListResult({
    this.count,
    this.next,
    this.previous,
    this.basePokemons,
  });

  PokemonListResult.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      basePokemons = new List<PokemonBase>();
      json['results'].forEach((v) {
        basePokemons.add(PokemonBase.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.basePokemons != null) {
      data['results'] = this.basePokemons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonBase {
  String name;
  String url;

  PokemonBase({this.name, this.url});

  PokemonBase.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}


class Pokemon{
  final String imageUrl;
  /*
  name, size .....
   */

  Pokemon(this.imageUrl);


}