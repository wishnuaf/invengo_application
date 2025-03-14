import 'package:http/http.dart' as http;
import 'package:invengo_application/api/endpoint.dart';

Future<http.Response> fetchPokemonAPI() {
  return http.get(Uri.parse('${Endpoint.baseUrl}/master/pokedex.json'));
}