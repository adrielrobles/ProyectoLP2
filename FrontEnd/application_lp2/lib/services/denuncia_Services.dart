import 'dart:convert';
import 'package:http/http.dart';

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
}
