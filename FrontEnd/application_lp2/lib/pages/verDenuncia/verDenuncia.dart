import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectolenguajes/models/denuncia.dart';
import 'package:proyectolenguajes/pages/crearDenuncia/crearDenuncia.dart';
import '../../widgets/blue_button.dart' as blue;
import '../../widgets/white_button.dart' as white;

import '../../models/hospital.dart';
import '../../services/denuncia_Services.dart';
import '../../services/hospital_Services.dart';

class VerDenunciaEspecificaPage extends StatefulWidget {
  const VerDenunciaEspecificaPage({Key? key}) : super(key: key);

  State<VerDenunciaEspecificaPage> createState() => _InicioState();
}

class _InicioState extends State<VerDenunciaEspecificaPage> {
  late Future<Denuncia> _denunciaEspecifica;
  late Future<Hospital> _hospitalEspecifico;
  bool _lightIsOn = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final todoDenuncia = {};

  @override
  void initState() {
    super.initState();
    _denunciaEspecifica = DenunciaService().getDenunciaEspecifica(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: FutureBuilder(
        future: _denunciaEspecifica,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Denuncia denun = snapshot.data;
            _hospitalEspecifico =
                HospitalService().getHospitalEspecifico(denun.idhospital);

            return FutureBuilder(
              future: _hospitalEspecifico,
              builder: (BuildContext context, AsyncSnapshot snapshot2) {
                if (snapshot2.hasData) {
                  Hospital hospi = snapshot2.data;
                  return Column(
                    children: [
                      Image(
                        image: AssetImage('../assets/denu.png'),
                        height: 100,
                        width: 300,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(255, 240, 242, 249)),
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                        margin: const EdgeInsets.only(left: 80.0, right: 80.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 40),
                                Column(
                                  children: [
                                    Image(
                                      image: NetworkImage(hospi.url),
                                      height: 150,
                                      width: 150,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 56, 83, 152)),
                                            shape: MaterialStateProperty.all(
                                                const StadiumBorder()),
                                            elevation:
                                                MaterialStateProperty.all(2),
                                          ),
                                          onPressed: () {},
                                          child: Container(
                                            width: 200,
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                "Ubicacion",
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 56, 83, 152)),
                                            shape: MaterialStateProperty.all(
                                                const StadiumBorder()),
                                            elevation:
                                                MaterialStateProperty.all(2),
                                          ),
                                          onPressed: () {},
                                          child: Container(
                                            width: 200,
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                "Historial",
                                                style: const TextStyle(
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Text(hospi.nombre,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 191, 203, 244),
                              ),
                              margin: EdgeInsets.all(20),
                              padding: const EdgeInsets.all(10),
                              height: 100,
                              child: Column(children: [
                                Row(
                                  children: [
                                    Text("Fecha: ",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        )),
                                    const SizedBox(width: 20),
                                    Text(denun.fechaDenuncia.split("T")[0],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Título:",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        )),
                                    const SizedBox(width: 20),
                                    Text(denun.titulo,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Detalle:",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        )),
                                    const SizedBox(width: 20),
                                    Text(denun.descripcion,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        )),
                                  ],
                                ),
                              ]),
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 200),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromRGBO(230, 65, 85, 1)),
                                    shape: MaterialStateProperty.all(
                                        const StadiumBorder()),
                                    elevation: MaterialStateProperty.all(2),
                                  ),
                                  onPressed: () {},
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        "Denunciar",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Toggle light when tapped.
                                      _lightIsOn = !_lightIsOn;
                                    });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      // Change button text when light changes state.
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.handshake,
                                            color: _lightIsOn
                                                ? Color.fromARGB(
                                                    255, 65, 113, 234)
                                                : Colors.black,
                                            size: 60,
                                          ),
                                          Text(_lightIsOn
                                              ? (denun.num_Apoyos + 1)
                                                  .toString()
                                              : (denun.num_Apoyos).toString()),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                } else if (snapshot2.hasError) {
                  print(snapshot2.error);
                  return Text("Error");
                }
                throw UnimplementedError();
              },
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Error");
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            label: 'Denuncias',
          ),
        ],
        iconSize: 30,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 230, 65, 84),
        onTap: _onItemTapped,
        backgroundColor: Color.fromARGB(255, 56, 83, 152),
      ),
    );
  }
}
