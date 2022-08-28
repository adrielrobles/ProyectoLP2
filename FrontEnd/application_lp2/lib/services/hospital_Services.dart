import 'dart:convert';
import 'package:http/http.dart';

import '../models/hospital.dart';

class HospitalService {
  final String _apiURL = "http://localhost:3001/hospital";
  
  Future<List<Hospital>> getHospitales() async {
    Response res = await get(Uri.parse(_apiURL));
    List<Hospital> hospitales = [];
    if(res.statusCode == 200) {
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
}