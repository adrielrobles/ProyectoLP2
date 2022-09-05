import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:proyectolenguajes/models/denuncia.dart';
import 'package:proyectolenguajes/pages/crearDenuncia/crearDenuncia.dart';

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

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _denunciaEspecifica = DenunciaService().getDenunciaEspecifica(1);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _denunciaEspecifica,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Denuncia denun = snapshot.data;

          return Column(
            children: [Text(denun.toString())],
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Error");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
