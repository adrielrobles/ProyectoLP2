import 'package:flutter/material.dart';

import '../../models/denuncia.dart';
import '../../services/denuncia_Services.dart';

class MostrarDenuncias extends StatefulWidget  {
  const MostrarDenuncias({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();

}
class _MainPageState extends State<MostrarDenuncias> {
  late Future<List<Denuncia>> _listaDenuncias;

  @override
  void initState() {
    super.initState();
    _listaDenuncias = DenunciaService().getDenunciasByCiudadano();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _futureCardBody()
      )
    );
  }

  Widget _futureCardBody() {
    return FutureBuilder(
      future: _listaDenuncias,
      builder: (BuildContext context, AsyncSnapshot  snapshot) {
        if (snapshot.hasData){
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              Denuncia _denuncia = snapshot.data[index];
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      ListTile(
                        title: Text(
                          _denuncia.titulo,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text(
                          _denuncia.descripcion,
                          style: const TextStyle(
                            color: Colors.black38,
                            fontStyle: FontStyle.italic
                          ),
                        ),
                        contentPadding: EdgeInsets.zero
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          _denuncia.descripcion,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 15)
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          Text(
                            " cupos disponibles",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black38
                            ),
                          ),
                          TextButton(
                            child: Row(
                              children: <Widget> [
                                Icon(
                                  Icons.info_outline,
                                  color: Colors.orange[300],
                                  size: 20,
                                ),
                                Text(
                                  " Mas información",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.orange[300],
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ]
                            ),
                            onPressed: (){
                             
                            }, 
                          )
                        ],
                      )
                    ]
                  )
                )
              );
            }
          );
        } else {
          print(snapshot.error);
          print(snapshot);
            return Text("Error");
        }
      }
    ); 
  }
}