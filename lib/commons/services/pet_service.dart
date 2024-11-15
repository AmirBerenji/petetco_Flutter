import 'dart:convert';

import 'package:petetco/commons/dto/petAddWeight_dto.dart';
import 'package:petetco/commons/dto/petAdd_dto.dart';
import 'package:petetco/commons/dto/petWeightList_dto.dart';
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

  Future<bool> addPet(PetAddDto pet) async {
    var token = await getToken();
    final url = Uri.parse('$baseUrl/pets');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer $token'
      ..headers['Accept'] = 'application/json';

    // Add fields to the request
    request.fields['name'] = pet.name.toString();
    request.fields['dob'] = pet.dob.toString();
    request.fields['breed_id'] = pet.breedId.toString();
    request.fields['color_id'] = pet.colorId.toString();
    request.fields['gender'] = pet.gender.toString();
    request.fields['passport_number'] =
        pet.PassportNumber == null ? "" : pet.PassportNumber.toString();
    request.fields['chipset_number'] =
        pet.ChipsetNumber == null ? "" : pet.ChipsetNumber.toString();

    // Attach the image file
    if (pet.cover != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'cover_image', // Field name expected by the backend
          pet.cover.path, // Path of the image file
          // Adjust if your image format differs
        ),
      );
    }

    // Send the request
    final response = await request.send();

    // Check the response status
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addPetWeight(PetWeightAddDto model) async {
    var token = await getToken();
    final url = Uri.parse('$baseUrl/weight');

    var request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer $token'
      ..headers['Accept'] = 'application/json';

    final body = jsonEncode({
      'pet_id': model.petId,
      'date': model.date,
      'weight': model.weight,
    });

    final response = await http.post(url, headers: request.headers, body: body);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<PetWeightListDto> getPetWeight(int petId) async {
    var token = await getToken();
    final url = Uri.parse('$baseUrl/weight');

    var request = http.MultipartRequest('GET', url)
      ..headers['Authorization'] = 'Bearer $token'
      ..headers['Accept'] = 'application/json';

    final body = jsonEncode({
      'pet_id': petId
    });

    final response = await http.post(url, headers: request.headers, body: body);

    if (response.statusCode == 200) {
       var listPetWeight = petWeightListDtoFromJson(response.body);
       return listPetWeight;
    }

    return PetWeightListDto();
  }

  Future<bool> addPetHeight(PetWeightAddDto model, int aaa) async {
    var token = await getToken();
    final url = Uri.parse('$baseUrl/height');

    var request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer $token'
      ..headers['Accept'] = 'application/json';

    final body = jsonEncode({
      'pet_id': model.petId,
      'date': model.date,
      'height': model.weight,
    });

    final response = await http.post(url, headers: request.headers, body: body);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
  
  Future<PetWeightListDto> getPetHeight(int petId) async {
    var token = await getToken();
    final url = Uri.parse('$baseUrl/height');

    var request = http.MultipartRequest('GET', url)
      ..headers['Authorization'] = 'Bearer $token'
      ..headers['Accept'] = 'application/json';

    final body = jsonEncode({
      'pet_id': petId
    });

    final response = await http.post(url, headers: request.headers, body: body);

    if (response.statusCode == 200) {
       var listPetHeight = petWeightListDtoFromJson(response.body);
       return listPetHeight;
    }

    return PetWeightListDto();
  }



}
