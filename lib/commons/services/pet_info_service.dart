import 'dart:convert';

import 'package:petetco/commons/models/petKindList_model.dart';
import 'package:petetco/commons/services/basic_service.dart';
import 'package:http/http.dart' as http;

class PetInfoService extends BasicService {

  Future<KindList> getAllPetKind() async {
    var token = await getToken();

    final url = Uri.parse('$baseUrl/kinds');

    final response = await http.get(url, headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    var kindList = KindList();
    if (response.statusCode == 200) {
      kindList = kindListFromJson(response.body);
      return kindList;
    } else {
      return kindList;
    }
  }
}
