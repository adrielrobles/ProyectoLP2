import 'package:flutter/material.dart';
import 'package:proyectolenguajes/pages/denuncias/mostrarDenuncias.dart';
import 'package:proyectolenguajes/pages/home/home_page.dart';
import 'package:proyectolenguajes/pages/verHospitales/verHospitales.dart';

//Todos
class NavBar extends StatefulWidget {
  const NavBar({Key? key, required this.idPage}) : super(key: key);
  final String idPage;
  State<NavBar> createState() => _InicioState(idPage);
}

class _InicioState extends State<NavBar> {
  int _selectedIndex = 0;

  _InicioState(String idPage) {
    _selectedIndex = int.parse(idPage);
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VerHospitalesPage()),
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MostrarDenuncias()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Hospitales',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Mis Denuncias',
        ),
      ],
      iconSize: 30,
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.white,
      selectedItemColor: Color.fromARGB(255, 230, 65, 84),
      onTap: _onItemTapped,
      backgroundColor: Color.fromARGB(255, 56, 83, 152),
    );
  }
}
