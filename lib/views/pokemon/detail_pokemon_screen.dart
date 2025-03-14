import 'package:flutter/material.dart';

class DetailPokemonScreen extends StatefulWidget {
  const DetailPokemonScreen({super.key});

  @override
  State<DetailPokemonScreen> createState() => _DetailPokemonScreenState();
}

class _DetailPokemonScreenState extends State<DetailPokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Pokémon', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),), backgroundColor: Colors.amberAccent, centerTitle: true,),
      body: Center(child: Text('Detail Pokémon')),
    );
  }
}