import 'dart:convert';
import 'package:http/http.dart';
import 'package:proyectolenguajes/models/usuario.dart';

//Todos
class UsuarioService {
  final String _apiURL = "http://localhost:3001/usuario";
  static int _idciudadano = 0;

  Future<List> validarUsuario(data) async {
    Response res = await post(Uri.parse(_apiURL),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      var res1 = [json["idciudadano"], true];
      _idciudadano = res1[0];
      return res1;
    } else {
      throw Exception("Fallo en el inicio de sesion");
    }
  }

  int recuperarCiudadano() {
    return _idciudadano;
  }
}
