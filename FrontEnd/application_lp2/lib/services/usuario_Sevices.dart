import 'dart:convert';
import 'package:http/http.dart';
import 'package:proyectolenguajes/models/usuario.dart';

class UsuarioService {
  final String _apiURL = "http://localhost:3001/usuario";

  Future<bool> validarUsuario(data) async {
    Response res = await post(Uri.parse(_apiURL),
      headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    if (res.statusCode == 200) {
      return true;
    } else {
      throw Exception("Fallo en el inicio de sesion");
    }
  }

}