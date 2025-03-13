import 'package:flutter/material.dart';
import 'package:invengo_application/api/album/model/pokemon.dart';
import 'package:invengo_application/api/pokemon/fetch_pokemon/fetch.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  late Future<Pokemon> futurePokemon;
  @override
  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Pokemon>(
  future: futurePokemon,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text(snapshot.data!.title);
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }

    // By default, show a loading spinner.
    return const CircularProgressIndicator();
  },
),
      ),
    );
  }
}