
import 'package:petetco/commons/models/colorList_model.dart';
import 'package:petetco/commons/models/petBreedList_model.dart';
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

  Future<BreedList> getAllPetBreed(int id) async {
    var token = await getToken();

    final url = Uri.parse('$baseUrl/breeds?kind_id=$id');

    final response = await http.get(url, headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    var breedList = BreedList();
    if (response.statusCode == 200) {
      breedList = breedListFromJson(response.body);
      return breedList;
    } else {
      return breedList;
    }
  }

   Future<ColorList> getAllPetColor() async {
    var token = await getToken();

    final url = Uri.parse('$baseUrl/colors');

    final response = await http.get(url, headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    var colorList = ColorList();
    if (response.statusCode == 200) {
      colorList = colorListFromJson(response.body);
      return colorList;
    } else {
      return colorList;
    }
  }
}
