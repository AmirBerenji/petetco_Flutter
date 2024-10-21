import 'package:http/http.dart' as http;
import 'package:petetco/commons/models/login_model.dart';
import 'package:petetco/commons/models/usercreate_model.dart';
import 'package:petetco/commons/models/userinfo_model.dart';
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
      var user  = userLoginFromJson(response.body);

      saveToken(user.data!.token.toString());

      return user; 
    }else
    {
      var errorMessage= jsonDecode(response.body);
      user.message = errorMessage["message"]; 
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
      
      
      var user  = userLoginFromJson(response.body); 
      saveToken(user.data!.token.toString());

      return user; 
    }else
    {
      var errorMessage = jsonDecode(response.body);
      user.message = errorMessage["message"]; 
      return user;
    }
  }
  
  Future<UserInfo> userInfo() async {
    var token = await getToken();
    
    final url = Uri.parse('$baseUrl/profile');

    final response = await http.get(
      url,
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      }
      
    );

    var user = UserInfo(); 
    if (response.statusCode == 200) {
      var user  = userInfoFromJson(response.body);

      return user; 
    }else
    {
      var errorMessage= jsonDecode(response.body);
      user.message = errorMessage["message"]; 
      return user;
    }
  }

}
