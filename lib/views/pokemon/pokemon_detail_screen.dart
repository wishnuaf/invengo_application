import 'package:flutter/material.dart';
import 'package:invengo_application/api/album/model/pokemon.dart';
import 'package:invengo_application/views/constant/app_color.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getPokemonColor(pokemon.type),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          Positioned(
            top: 100,
            left: 20,
            child: Text(
              pokemon.name,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            top: 100,
            right: 20,
            child: Text(
              "#${pokemon.num}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ),

          Positioned(
            top: 150,
            left: 20,
            child: Row(
              children:
                  pokemon.type.map((type) {
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(type, style: TextStyle(color: Colors.white)),
                    );
                  }).toList(),
            ),
          ),

          Positioned(
            top: 200,
            right: -50,
            child: Image.asset(
              "assets/images/pokeball.png",
              height: 350,
              color: Colors.white.withOpacity(0.3),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 150),
              child: Image.network(pokemon.img, height: 150, fit: BoxFit.cover),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.55,
            minChildSize: 0.55,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "About",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: 16),
                      _infoRow("Height", pokemon.height),
                      _infoRow("Weight", pokemon.weight),
                      _infoRow("Candy", pokemon.candy),
                      _infoRow("Candy Count", pokemon.candyCount.toString()),
                      _infoRow("Egg", pokemon.egg),
                      _infoRow("Spawn Chance", pokemon.spawnChance.toString()),
                      _infoRow("Avg Spawns", pokemon.avgSpawns.toString()),
                      _infoRow("Spawn Time", pokemon.spawnTime),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          "Weaknesses",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            pokemon.weaknesses.map((type) {
                              return Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: getPokemonColor(pokemon.type),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  type,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(value, style: TextStyle(color: Colors.grey[600], fontSize: 16)),
        ],
      ),
    );
  }
}
