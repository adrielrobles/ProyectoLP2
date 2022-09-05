import 'dart:convert';
import 'package:http/http.dart';
import 'package:proyectolenguajes/models/denuncia.dart';

class DenunciaService {
  final String _apiURL = "http://localhost:3001/denuncia";
  final String _apiURL2 = "http://localhost:3001/";

  Future<bool> crearDenuncia(data) async {
    Response res = await post(Uri.parse(_apiURL),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    if (res.statusCode == 201) {
      return true;
    } else {
      throw Exception("Fallo la insercion en Favoritos");
    }
  }

  Future<bool> eliminarDenuncia(iddenuncia) async {
    Response res = await post(Uri.parse(_apiURL2 + "delete/" + iddenuncia),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(iddenuncia));
    if (res.statusCode == 201) {
      return true;
    } else {
      throw Exception("Fallo la eliminación");
    }
  }

  Future<Denuncia> getDenunciaEspecifica(int id) async {
    String idS = id.toString();
    Response res = await get(Uri.parse(_apiURL + '/' + idS));

    if (res.statusCode == 200) {
      String body = utf8.decode(res.bodyBytes);
      print(body);
      var json = jsonDecode(body)['content'];

      return Denuncia.fromMap(json);
    } else {
      throw Exception("Fallo la peticion de Denuncia");
    }
  }
}
