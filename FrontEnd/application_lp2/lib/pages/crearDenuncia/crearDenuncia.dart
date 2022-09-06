import 'package:flutter/material.dart';
import 'package:proyectolenguajes/services/usuario_Sevices.dart';

import '../../models/hospital.dart';
import '../../services/denuncia_Services.dart';
import '../../services/hospital_Services.dart';
import '../home/home_page.dart';

class CrearDenunciaPage extends StatefulWidget {
  const CrearDenunciaPage({Key? key, required this.idhospital})
      : super(key: key);
  final String idhospital;

  State<CrearDenunciaPage> createState() => _InicioState(idhospital);
}

List<DropdownMenuItem<String>> dropdownItems(List<Hospital> data) {
  List<DropdownMenuItem<String>> menuItems = [];
  data.forEach((hospital) {
    menuItems.add(DropdownMenuItem(
        child: Text(
          "${hospital.nombre}",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        value: "${hospital.idhospital}"));
  });
  return menuItems;
}

class _InicioState extends State<CrearDenunciaPage> {
  String selectedValue = "1";

  _InicioState(String id_hospital) {
    selectedValue = id_hospital;
  }

  late Future<List<Hospital>> _hospitales;
  String? dropDownValue;
  TextEditingController? textController1;
  TextEditingController? textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void crearDenuncia() {
    final data = {
      "titulo": "${textController1?.text}",
      "descripcion": "${textController2?.text}",
      "idciudadano": UsuarioService().recuperarCiudadano(),
      "idhospital": int.parse(selectedValue)
    };
    DenunciaService().crearDenuncia(data).then((value) => {
          if (value) {_showAlertDialog()}
        });
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 196, 196, 196),
            title: Text("¡¡ Denuncia Creada con exito !!"),
            actions: <Widget>[
              FlatButton(
                  color: Color.fromARGB(255, 230, 65, 84),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Cerrar",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
    textController1?.clear();
    textController2?.clear();
  }

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    _hospitales = HospitalService().getHospitales();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 56, 83, 152),
      body: FutureBuilder(
        future: _hospitales,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 56, 83, 152),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 56, 83, 152),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Text('Crear Denuncia',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 45,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                          child: Text('Porfavor completar información ',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 18,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 56, 83, 152),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 0, 22, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hospital a denunciar:',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 18,
                              )),
                          Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              104, 196, 196, 196),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              104, 196, 196, 196),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(104, 196, 196, 196),
                                  ),
                                  dropdownColor:
                                      Color.fromARGB(220, 56, 83, 152),
                                  value: selectedValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                  items: dropdownItems(
                                      snapshot.data as List<Hospital>))),
                          Text('Titulo de la Denuncia:',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 18,
                              )),
                          TextFormField(
                            controller: textController1,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Ingrese un titulo',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(104, 196, 196, 196),
                            ),
                          ),
                          Text('Descripción:',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 18,
                              )),
                          Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: textController2,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Ingrese una descripcion',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(104, 196, 196, 196),
                              ),
                              maxLines: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 0, 22, 0),
                      child: FlatButton(
                          color: Color.fromARGB(255, 230, 65, 84),
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Denunciar",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            crearDenuncia();
                          }),
                    ),
                  )
                ],
              ),
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
    );
  }
}
