import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:invengo_application/api/album/model/pokemon.dart';
import 'package:invengo_application/api/endpoint.dart';

Future<List<Pokemon>> fetchPokemonList() async {
  final response = await http.get(Uri.parse(
      '${Endpoint.baseUrl}/master/pokedex.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    Pokedex pokedex = Pokedex.fromJson(jsonData);
    return pokedex.pokemon;
  } else {
    throw Exception('Gagal mengambil data Pokémon');
  }
}
