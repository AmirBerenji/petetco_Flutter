import 'dart:convert';

import 'package:petetco/commons/models/pet_model.dart';
import 'package:petetco/commons/models/petlist_model.dart';
import 'package:petetco/commons/services/basic_service.dart';
import 'package:http/http.dart' as http;

class PetService extends BasicService {
  Future<PetList> getAllPet() async {
    var token = await getToken();

    final url = Uri.parse('$baseUrl/pets');

    final response = await http.get(url, headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    var petList = PetList();
    if (response.statusCode == 200) {
      petList = petListFromJson(response.body);
      return petList;
    } else {
      var errorMessage = jsonDecode(response.body);
      petList.message = errorMessage["message"];
      return petList;
    }
  }

  Future<PetList> addPet(Pet pet) async {
    var token = await getToken();

    final url = Uri.parse('$baseUrl/pets');

    final response = await http.post(url, headers: <String, String>{
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, String>{
        'name': pet.name.toString(),
        'dob': pet.dob.toString() ,
      }),);

    var petList = PetList();
    if (response.statusCode == 200) {
      petList = petListFromJson(response.body);
      return petList;
    } else {
      var errorMessage = jsonDecode(response.body);
      petList.message = errorMessage["message"];
      return petList;
    }
  }

  
}
