import 'dart:convert';
import 'dart:ui';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.species,
    required this.sprites,
    required this.types,
  });

  int id;
  String name;
  Species species;
  Sprites sprites;
  List<Type> types;
  late Color averageColor;

  String get idNumber => '#${id.toString().padLeft(3, '0')}';

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    id: json["id"],
    name: json["name"],
    species: Species.fromJson(json["species"]),
    sprites: Sprites.fromJson(json["sprites"]),
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "species": species.toJson(),
    "sprites": sprites.toJson(),
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
  };
}


class Species {
  Species({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class Sprites {
  Sprites({
    required this.other,
  });
  Other other;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    other: Other.fromJson(json["other"]),
  );

  Map<String, dynamic> toJson() => {
    "other": other.toJson(),
  };
}


class Other {
  Other({
    required this.officialArtwork,
  });
  OfficialArtwork officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
  );

  Map<String, dynamic> toJson() => {
    "official-artwork": officialArtwork.toJson(),
  };
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
  });

  String frontDefault;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
  };
}
class Type {
  Type({
    required this.type,
  });
  Species type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    type: Species.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type.toJson(),
  };
}
