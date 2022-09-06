import 'package:flutter/material.dart';
import 'package:proyectolenguajes/services/usuario_Sevices.dart';

import '../../models/denuncia.dart';
import '../../services/denuncia_Services.dart';
import '../../widgets/nav_Bar.dart';

//Jean Moreano
class MostrarDenuncias extends StatefulWidget {
  const MostrarDenuncias({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MostrarDenuncias> {
  late Future<List<Denuncia>> _listaDenuncias;

  @override
  void initState() {
    super.initState();
    print(UsuarioService().recuperarCiudadano());
    _listaDenuncias = DenunciaService()
        .getDenunciasByCiudadano(UsuarioService().recuperarCiudadano());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: NavBar(
              idPage: '2',
            ),
            body: _futureCardBody()));
  }

  Widget _futureCardBody() {
    String estadoText = "";
    Color estadoColor = Color.fromARGB(255, 56, 83, 152);
    return FutureBuilder(
        future: _listaDenuncias,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 65, 85),
                    ),
                    child: Text(
                      '\nMis Denuncias',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          Denuncia _denuncia = snapshot.data[index];
                          if (_denuncia.idestado == 1) {
                            estadoText = "Sin Procesar";
                            estadoColor = Color.fromARGB(255, 230, 65, 85);
                          } else if (_denuncia.idestado == 2) {
                            estadoText = "En Proceso";
                            estadoColor = Color.fromARGB(255, 230, 65, 85);
                          } else if (_denuncia.idestado == 3) {
                            estadoText = "Resuelto";
                            estadoColor = Color.fromARGB(255, 92, 129, 224);
                          }
                          return Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "#" +
                                                  _denuncia.iddenuncia
                                                      .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor: estadoColor,
                                                  minimumSize:
                                                      const Size(150, 50),
                                                ),
                                                child: Text(
                                                  estadoText,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                onPressed: () {}),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text(
                                                  "Fecha de la denuncia: ",
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text(
                                                  _denuncia.fechaDenuncia,
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 15)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text(
                                                  "Título de la denuncia: ",
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text(_denuncia.titulo,
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 15)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text(
                                                  "Descripción de la denuncia: ",
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Text(_denuncia.descripcion,
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 15)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            TextButton(
                                              child: Row(children: <Widget>[
                                                Icon(
                                                  Icons.handshake,
                                                  color: Color.fromARGB(
                                                      255, 65, 113, 234),
                                                  size: 25,
                                                ),
                                                Text(
                                                  _denuncia.num_Apoyos
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 65, 113, 234),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ]),
                                              onPressed: () {},
                                            ),
                                            TextButton(
                                              child: Row(children: <Widget>[
                                                Icon(
                                                  Icons.delete,
                                                  color: Color.fromARGB(
                                                      255, 255, 77, 77),
                                                  size: 20,
                                                ),
                                                Text(
                                                  " Eliminar",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 255, 77, 77),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ]),
                                              onPressed: () {
                                                DenunciaService()
                                                    .eliminarDenuncia(
                                                        _denuncia.iddenuncia)
                                                    .then((value) {
                                                  setState(() {
                                                    _listaDenuncias = DenunciaService()
                                                        .getDenunciasByCiudadano(
                                                            UsuarioService()
                                                                .recuperarCiudadano());
                                                  });
                                                });
                                              },
                                            )
                                          ],
                                        )
                                      ])));
                        }),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
