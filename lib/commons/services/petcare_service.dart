import 'package:petetco/commons/dto/listpetcare_dto.dart';
import 'package:petetco/commons/services/basic_service.dart';
import 'package:http/http.dart' as http;


class PetCareService extends BasicService
{

  Future<ListPetCareDto> GetAllPetCare() async {
    var token = await getToken();

    final url = Uri.parse('$baseUrl/routine-cares');

    final response = await http.get(url, headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    var listPetCare = ListPetCareDto();
    if (response.statusCode == 200) {
      listPetCare = listPetCareDtoFromJson(response.body);
      return listPetCare;
    } else {
      return listPetCare;
    }
  }
}