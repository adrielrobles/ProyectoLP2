import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:proyectolenguajes/pages/crearDenuncia/crearDenuncia.dart';

import '../../models/hospital.dart';
import '../../services/denuncia_Services.dart';
import '../../services/hospital_Services.dart';

class VerHospitalesPage extends StatefulWidget {
  const VerHospitalesPage({Key? key}) : super(key: key);

  State<VerHospitalesPage> createState() => _InicioState();

}

class _InicioState extends State<VerHospitalesPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late Future<List<Hospital>> _listaHospitales;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    _listaHospitales = HospitalService().getHospitales();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: FutureBuilder(
          future: _listaHospitales,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GestureDetector(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFFD43232),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            child: // Generated code for this Container Widget...
                                                Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 0),
                                                        child: TextFormField(
                                                          controller:
                                                              textController,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Buscar Hospital',
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .search_sharp,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 8, 0),
                                                      child: FlatButton(
                                                          color: Color.fromARGB(
                                                              255, 230, 65, 84),
                                                          textColor:
                                                              Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: Text(
                                                            "Buscar",
                                                            style: TextStyle(
                                                              fontSize: 20.0,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              String? nombre =textController?.text;
                                                              _listaHospitales =  HospitalService().searchHospitales(nombre);
                                                              
                                                            });
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 15),
                        child: Text(
                          'Hospitales denunciados:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            Hospital _info = snapshot.data[index];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 15, 8, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 210,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: Color(0x411D2429),
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 0, 0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  _info.url,
                                                  width: 120,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  _info.nombre,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Container(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Text(
                                                  "Celular: " + _info.telefono,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Container(
                                                color: Colors.transparent,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(60, 3, 60, 3),
                                                  child: FlatButton(
                                                      color: Color.fromARGB(
                                                          255, 56, 83, 152),
                                                      textColor: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      child: Text(
                                                        "Historial de Denuncias",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      onPressed: () {}),
                                                ),
                                              ),
                                              Container(
                                                color: Colors.transparent,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 60,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(60, 4, 60, 4),
                                                  child: FlatButton(
                                                      color: Color.fromARGB(
                                                          255, 230, 65, 84),
                                                      textColor: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      child: Text(
                                                        "Denunciar",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                   CrearDenunciaPage(idhospital: _info.idhospital.toString(),)),
                                                        );
                                                      }),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
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
