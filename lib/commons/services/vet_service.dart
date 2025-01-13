import 'dart:convert';

import 'package:petetco/commons/dto/vetlist_dto.dart';
import 'package:petetco/commons/services/basic_service.dart';
import 'package:http/http.dart' as http;

class VetService extends BasicService {
  Future<VetListDto> getAllVet() async {
    var token = await getToken();

    final url = Uri.parse('$baseUrl/vets');

    final response = await http.get(url, headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    var vetList = VetListDto();

    if (response.statusCode == 200) {
      vetList = vetListDtoFromJson(response.body);
      return vetList;
    } else {
      var errorMessage = jsonDecode(response.body);
      vetList.message = errorMessage["message"];
      return vetList;
    }
  }
}
