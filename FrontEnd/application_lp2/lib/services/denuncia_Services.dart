import 'dart:convert';
import 'package:http/http.dart';
import 'package:proyectolenguajes/models/denuncia.dart';

import '../models/denuncia.dart';

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

  //ACTUALIZAR APOYO

  Future<bool> actualizarApoyo(idDenuncia) async {
    Response res = await put(Uri.parse('$_apiURL/apoyo/$idDenuncia'));

    if (res.statusCode == 200) {
      return true;
    } else {
      throw Exception("Fallo la insercion en Favoritos");
    }
  }

  Future<List<Denuncia>> getDenunciasByCiudadano() async {
    Response res = await get(Uri.parse('$_apiURL/ciudadano?idciudadano=1'));
    List<Denuncia> denuncias = [];
    if (res.statusCode == 200) {
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

  Future<List<Denuncia>> getDenunciasByHospital(int id) async {
    String? idhospital = id.toString();
    Response res =
        await get(Uri.parse('$_apiURL/hospital?idhospital=' + idhospital));
    List<Denuncia> denuncias = [];
    if (res.statusCode == 200) {
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

  Future<bool> eliminarDenuncia(int iddenuncia) async {
    Response res = await post(Uri.parse(_apiURL + "/delete/" + iddenuncia.toString()));
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

      var json = jsonDecode(body)['content'];

      return Denuncia.fromMap(json);
    } else {
      throw Exception("Fallo la peticion de Denuncia");
    }
  }

  //todas las denuncias
  Future<List<Denuncia>> getTodasDenuncia() async {
    Response res = await get(Uri.parse(_apiURL));
    List<Denuncia> denuncias = [];
    if (res.statusCode == 200) {
      var json = List.from(jsonDecode(res.body));
      for (var element in json) {
        Denuncia hospital = Denuncia.fromMap(element);
        denuncias.add(hospital);
      }

      return denuncias;
    } else {
      throw Exception("Fallo la peticion de Denuncias");
    }
  }
}
