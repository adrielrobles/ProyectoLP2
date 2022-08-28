import 'dart:convert';
import 'package:http/http.dart';

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
}