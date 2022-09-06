import 'package:flutter/material.dart';

import '../../models/denuncia.dart';
import '../../services/denuncia_Services.dart';
import '../../models/hospital.dart';
import '../../services/hospital_Services.dart';
import 'package:proyectolenguajes/widgets/nav_Bar.dart';

import '../verDenuncia/verDenuncia.dart';

class TodasDenunciasApp extends StatefulWidget {
  const TodasDenunciasApp({Key? key}) : super(key: key);
  State<TodasDenunciasApp> createState() => _InicioState();
}

class _InicioState extends State<TodasDenunciasApp> {
  late Future<List<Denuncia>> _listaDenuncias;
  late Future<Hospital> _hospitalEspecifico;

  @override
  void initState() {
    super.initState();
    _listaDenuncias = DenunciaService().getTodasDenuncia();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _futureCardBody()));
  }

  Widget _futureCardBody() {
    String estadoText = "";
    Color estadoColor = Color.fromARGB(255, 56, 83, 152);
    return Scaffold(
      body: FutureBuilder(
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
                        '\n¡Conoce las denuncias de tu comunidad!',
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
                            _hospitalEspecifico = HospitalService()
                                .getHospitalEspecifico(_denuncia.idhospital);
                            return FutureBuilder(
                              future: _hospitalEspecifico,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot2) {
                                if (snapshot2.hasData) {
                                  Hospital hospi = snapshot2.data;
                                  return Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: const EdgeInsets.only(
                                          left: 80.0,
                                          right: 80.0,
                                          top: 20,
                                          bottom: 20),
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                //imagen
                                                Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          hospi.url),
                                                      height: 200,
                                                      width: 200,
                                                    )),
                                                //descripciones
                                                Column(
                                                  children: [
                                                    //titulo
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                                child: Text(
                                                                    "Título: ",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold))),
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10),
                                                                child: Text(
                                                                    _denuncia
                                                                        .titulo,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                    )))
                                                          ],
                                                        )),

                                                    // nombre del hospital

                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                                child: Text(
                                                                    "Hospital: ",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold))),
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10),
                                                                child: Text(
                                                                    hospi
                                                                        .nombre,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                    )))
                                                          ],
                                                        )),

                                                    //fecha de la denuncia
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                                child: Text(
                                                                    "Fecha: ",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold))),
                                                            Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        10),
                                                                child: Text(
                                                                    _denuncia.fechaDenuncia.split(
                                                                        "T")[0],
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                    )))
                                                          ],
                                                        )),
                                                  ],
                                                ),

                                                Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Column(
                                                      children: [
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Color
                                                                        .fromARGB(
                                                                            255,
                                                                            56,
                                                                            83,
                                                                            152)),
                                                            shape: MaterialStateProperty
                                                                .all(
                                                                    const StadiumBorder()),
                                                            elevation:
                                                                MaterialStateProperty
                                                                    .all(2),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      VerDenunciaEspecificaPage(
                                                                          idDenunciaS:
                                                                              _denuncia.iddenuncia)),
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 200,
                                                            height: 50,
                                                            child: Center(
                                                              child: Text(
                                                                "Mas Información",
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Color
                                                                        .fromRGBO(
                                                                            230,
                                                                            65,
                                                                            85,
                                                                            1)),
                                                            shape: MaterialStateProperty
                                                                .all(
                                                                    const StadiumBorder()),
                                                            elevation:
                                                                MaterialStateProperty
                                                                    .all(2),
                                                          ),
                                                          onPressed: () {
                                                            Navigator
                                                                .pushReplacementNamed(
                                                                    context,
                                                                    'crearDenuncia');
                                                          },
                                                          child: Container(
                                                            width: 200,
                                                            height: 50,
                                                            child: Center(
                                                              child: Text(
                                                                "Denunciar",
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            15),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        TextButton(
                                                          child: Row(children: <
                                                              Widget>[
                                                            Icon(
                                                              Icons.handshake,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      65,
                                                                      113,
                                                                      234),
                                                              size: 25,
                                                            ),
                                                            Text(
                                                              _denuncia
                                                                  .num_Apoyos
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          65,
                                                                          113,
                                                                          234),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          ]),
                                                          onPressed: () {},
                                                        ),
                                                      ],
                                                    )),
                                              ])));
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            );
                          }),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      bottomNavigationBar: NavBar(
        idPage: '0',
      ),
    );
  }
}
