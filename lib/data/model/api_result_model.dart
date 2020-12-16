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
  String name;
  String imageUrl;
  String weight;
  String size;
  String height;

  /*
  name, size .....
   */

  Pokemon({this.name, this.imageUrl, this.weight, this.size, this.height});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['sprites']['front_default'];
    weight = json['weight'];
    size = json['size'];
    height = json['height'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sprites']['front_default'] = this.imageUrl;
    data['weight'] = this.weight;
    data['size'] = this.size;
    data['height'] = this.height;

    return data;
  }

}