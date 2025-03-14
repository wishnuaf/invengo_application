class Pokemon {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final List<String> weaknesses;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.weaknesses,
  });

  // Factory method untuk mengonversi JSON menjadi objek Pokemon
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'],
      type: List<String>.from(json['type']),
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      weaknesses: List<String>.from(json['weaknesses']),
    );
  }
}

// Model utama untuk daftar Pokemon (Pokedex)
class Pokedex {
  final List<Pokemon> pokemon;

  Pokedex({required this.pokemon});

  factory Pokedex.fromJson(Map<String, dynamic> json) {
    return Pokedex(
      pokemon: (json['pokemon'] as List)
          .map((data) => Pokemon.fromJson(data))
          .toList(),
    );
  }
}
