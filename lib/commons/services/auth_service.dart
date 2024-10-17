import 'package:http/http.dart' as http;
import 'package:petetco/commons/models/login_model.dart';
import 'package:petetco/commons/models/usercreate_model.dart';
import 'package:petetco/commons/models/userlogin_model.dart';
import 'dart:convert';

import 'package:petetco/commons/services/basic_service.dart';

class AuthService extends BasicService {
    
    
  Future<UserLogin> login(Login login) async {
    final url = Uri.parse('$baseUrl/login');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': login.email,
        'password': login.password,
      }),
    );

    var user = new UserLogin();
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var user  = userLoginFromJson(response.body); 
      return user; 
    }else
    {
      var xx = jsonDecode(response.body);
      user.message = xx["message"]; 
      return user;
    }
  }





   Future<UserLogin> register(UserCreate userCreate) async {
    final url = Uri.parse('$baseUrl/register');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email':userCreate.email,
        'password':userCreate.password,
        'password_confirmation' : userCreate.passwordConfirmation,
        'name': userCreate.name
      }),
    );

    var user = new UserLogin();
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var user  = userLoginFromJson(response.body); 
      return user; 
    }else
    {
      var errorMessage = jsonDecode(response.body);
      user.message = errorMessage["message"]; 
      return user;
    }
  }
}
