import 'dart:convert';
import 'package:http/http.dart';

import '../models/denuncia.dart';

class DenunciaService {
  final String _apiURL = "http://localhost:3001/denuncia";

  Future<bool> crearDenuncia(data) async {
    Response res = await post(Uri.parse(_apiURL),headers: {"Content-Type": "application/json"},body: jsonEncode(data));
    if (res.statusCode == 201) {
      return true;
    } else {
      throw Exception("Fallo la insercion en Favoritos");
    }
  }

  Future<List<Denuncia>> getDenunciasByCiudadano() async {
    Response res = await get(Uri.parse('$_apiURL/ciudadano?idciudadano=1'));
    List<Denuncia> denuncias = [];
    if(res.statusCode == 200) {
      var json = List.from(jsonDecode(res.body));
      for (var element in json) {
        Denuncia denuncia = Denuncia.fromMap(element);
        denuncias.add(denuncia);
      }
      
      return denuncias;
    } else {
      throw Exception("Fallo la peticion de Denuncias");
    }
  }


}