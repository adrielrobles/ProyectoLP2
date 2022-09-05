import 'package:flutter/material.dart';

import '../../models/hospital.dart';
import '../../services/denuncia_Services.dart';
import '../../services/hospital_Services.dart';

class Eliminar extends StatelessWidget {
  String selectedValue = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 56, 83, 152),
        appBar: AppBar(
          title: const Text("Confirmación para eliminar"),
        ),
        body: Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Column(
              children: <Widget>[
                Text('¿Estas seguro que deseas eliminarla?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 20,
                    )),
                Text('Eliminar denuncia #1:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 18,
                    )),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.contain, // otherwise the logo will be tiny
                    child: RaisedButton(
                        color: Color.fromARGB(255, 230, 65, 84),
                        textColor: Colors.white,
                        child: Text(
                          "Eliminar denuncia",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {}),
                  ),
                ),
              ],
            )));
  }
}
