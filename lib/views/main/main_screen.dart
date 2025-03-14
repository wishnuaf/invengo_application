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
      appBar: AppBar(title: Text("Main Screen", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),), backgroundColor: Colors.amberAccent, centerTitle: true,),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amberAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Invengo Application',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Welcome, ${widget.email}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Phone: ${widget.phone}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Main Screen'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Pokemon Screen'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PokemonScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
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