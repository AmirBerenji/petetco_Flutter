import 'dart:convert';

import 'package:petetco/commons/dto/branchlist_dto.dart';
import 'package:petetco/commons/helper/public_method.dart';
import 'package:petetco/commons/services/basic_service.dart';
import 'package:http/http.dart' as http;

class BranchService extends BasicService {
  Future<BranchListDto> getAllBranch(Map<String, dynamic> data) async {
    String queryString = PublicMethod.convertGetApiParam(data);

    var token = await getToken();

    final url = Uri.parse('$baseUrl/branches$queryString');

    final response = await http.get(url, headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    var branchList = BranchListDto();

    if (response.statusCode == 200) {
      branchList = branchListDtoFromJson(response.body);
      return branchList;
    } else {
      var errorMessage = jsonDecode(response.body);
      //branchList.message = errorMessage["message"];
      return branchList;
    }
  }
}
