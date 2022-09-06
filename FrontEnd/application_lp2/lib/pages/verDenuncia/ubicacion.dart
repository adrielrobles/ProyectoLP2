import 'package:flutter/material.dart';
import 'package:proyectolenguajes/widgets/nav_Bar.dart';

//Darinka Townsend
class ubicacionApp extends StatefulWidget {
  const ubicacionApp({Key? key}) : super(key: key);

  @override
  _ubicacionApp createState() => _ubicacionApp();
}

class _ubicacionApp extends State<ubicacionApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicación'),
        backgroundColor: Color.fromARGB(255, 56, 83, 152),
      ),
      body: Container(
          child: Image(image: AssetImage('../assets/mapa.png'), height: 1000)),
      bottomNavigationBar: NavBar(
        idPage: '0',
      ),
    );
  }
}
