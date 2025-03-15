import 'package:flutter/material.dart';

// Mapping warna berdasarkan tipe Pokémon
Map<String, Color> typeColors = {
  "Grass": Colors.green,
  "Fire": Colors.red,
  "Water": Colors.blue,
  "Electric": Colors.yellow,
  "Poison": Colors.purple,
  "Bug": Colors.lightGreen,
  "Normal": Colors.grey,
  "Flying": Colors.indigo,
  "Ground": Colors.brown,
  "Rock": Colors.brown.shade700,
  "Psychic": Colors.pink,
  "Ice": Colors.cyan,
  "Ghost": Colors.deepPurple,
  "Dragon": Colors.indigo.shade900,
  "Dark": Colors.black,
  "Steel": Colors.blueGrey,
  "Fairy": Colors.pinkAccent,
};

// Fungsi untuk mendapatkan warna dari tipe Pokémon
Color getPokemonColor(List<String> types) {
  for (var type in types) {
    if (typeColors.containsKey(type)) {
      return typeColors[type]!;
    }
  }
  return Colors.grey; // Default jika tipe tidak ditemukan
}
