import 'package:flutter/material.dart';
import 'package:invengo_application/api/album/model/pokemon.dart';
import 'package:invengo_application/api/pokemon/fetch_pokemon/fetch.dart';
import 'package:invengo_application/views/pokemon/detail_pokemon_screen.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  late Future<List<Pokemon>> futurePokemonList;

  @override
  void initState() {
    super.initState();
    futurePokemonList = fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokedex", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),), backgroundColor: Colors.amberAccent, centerTitle: true,),
      body: Container(
        color: Colors.amber[50],
        child: FutureBuilder<List<Pokemon>>(
          future: futurePokemonList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("Tidak ada data Pokémon"));
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.0,
                ),
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Pokemon pokemon = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPokemonScreen(),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(pokemon.img, height: 100),
                          Text(
                            pokemon.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
