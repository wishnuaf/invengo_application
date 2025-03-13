import 'dart:convert';

import 'package:invengo_application/api/album/model/pokemon.dart';
import 'package:invengo_application/api/endpoint.dart';
import 'package:http/http.dart' as http;

Future<Pokemon> fetchPokemon() async {
  final response = await http.get(
    Uri.parse('${Endpoint.baseUrl}/pokemon-form'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Pokemon.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}