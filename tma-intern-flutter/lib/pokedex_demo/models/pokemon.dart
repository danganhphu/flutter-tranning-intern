
class Pokemon {
  final String name;
  final String id;
  final String imageurl;
  final List<String> typeofpokemon;
  // late Color averageColor;

  Pokemon({required this.name, required this.id, required this.imageurl, required this.typeofpokemon});

 factory Pokemon.fromJson(Map<dynamic, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageurl : json['imageurl'],
      typeofpokemon : json['typeofpokemon'].cast<String>()
    );
  }

  Map<dynamic, dynamic> toJson() => {
   'id': id,
    'name': name,
    'imageurl': imageurl,
    'typeofpokemon' : typeofpokemon
  };
}
