import 'package:flutter/material.dart';
import 'package:invengo_application/views/pokemon/pokemon_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.email, required this.phone});
  final String email;
  final String phone;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
                     onPressed: () {
                       Navigator.of(context).push(
                         MaterialPageRoute(
                           builder: (context) => PokemonScreen(),
                         ),
                       );
                     },
                     child: Text("Pokemon Screen"),
                   ),
                   ),
    );
  }
}