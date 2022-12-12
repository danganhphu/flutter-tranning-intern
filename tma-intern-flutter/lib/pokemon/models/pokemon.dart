
import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  List<Species> forms;
  String name;
  int order;
  Sprites sprites;
  List<Type> types;
  Pokemon({
    required this.forms,
    required this.name,
    required this.order,
    required this.sprites,
    required this.types,
  });

  String get orderNumber => '#${order.toString().padLeft(3, '0')}';

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    forms: List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
    name: json["name"],
    order: json["order"],
    sprites: Sprites.fromJson(json["sprites"]),
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
    "name": name,
    "order": order,
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
    "other": other == null ? null : other.toJson(),
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
    required this.slot,
    required this.type,
  });

  int slot;
  Species type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: Species.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type.toJson(),
  };
}
