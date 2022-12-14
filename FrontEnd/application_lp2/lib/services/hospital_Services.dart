import 'dart:convert';
import 'package:http/http.dart';

import '../models/hospital.dart';

//Todos
class HospitalService {
  final String _apiURL = "http://localhost:3001/hospital";

  Future<List<Hospital>> getHospitales() async {
    Response res = await get(Uri.parse(_apiURL));
    List<Hospital> hospitales = [];
    if (res.statusCode == 200) {
      var json = List.from(jsonDecode(res.body));
      for (var element in json) {
        Hospital hospital = Hospital.fromMap(element);
        hospitales.add(hospital);
      }
      return hospitales;
    } else {
      throw Exception("Fallo la peticion de Hospitales");
    }
  }

  Future<List<Hospital>> searchHospitales(String? name) async {
    Response res = await get(Uri.parse(_apiURL + "/search?nombre=" + name!));
    List<Hospital> hospitales = [];
    if (res.statusCode == 200) {
      var json = List.from(jsonDecode(res.body));
      for (var element in json) {
        Hospital hospital = Hospital.fromMap(element);
        hospitales.add(hospital);
      }
      if (hospitales.isNotEmpty) {
        return hospitales;
      }
      return getHospitales();
    } else {
      throw Exception("Fallo la peticion de Hospitales");
    }
  }

  //VER HOSPITAL POR ID
  Future<Hospital> getHospitalEspecifico(int id) async {
    String idS = id.toString();
    Response res = await get(Uri.parse(_apiURL + '/' + idS));

    if (res.statusCode == 200) {
      String body = utf8.decode(res.bodyBytes);

      var json = jsonDecode(body)['content'];

      return Hospital.fromMap(json);
    } else {
      throw Exception("Fallo la peticion de Hospital");
    }
  }
}
