class PokemonListResult {
  int count;
  List<PokemonBase> basePokemons;

  PokemonListResult({
    this.count,
    this.basePokemons,
  });

  factory PokemonListResult.fromJson(Map<String, dynamic> json) {
    var count = json['count'];
    var basePokemons = List<PokemonBase>();
    if (json['results'] != null) {
      json['results'].forEach((v) {
        basePokemons.add(
          PokemonBase.fromJson(v),
        );
      });
    }

    return PokemonListResult(count: count, basePokemons: basePokemons);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
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

class Pokemon {
  String name;
  String imageUrl;
  int weight;
  int size;
  int height;
  int id;
  int order;

  Pokemon({
    this.name,
    this.imageUrl,
    this.weight,
    this.size,
    this.height,
    this.id,
    this.order,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'] as String,
      imageUrl: json['sprites']['front_default'],
      weight: json['weight'] as num,
      size: json['size'],
      height: json['height'],
      id: json['id'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['weight'] = this.weight;
    data['size'] = this.size;
    data['height'] = this.height;
    data['id'] = this.id;
    data['order'] = this.order;
    return data;
  }
}
