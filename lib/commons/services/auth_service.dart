import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:petetco/commons/models/login_model.dart';
import 'package:petetco/commons/dto/usercreate_dto.dart';
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
      var user = userLoginFromJson(response.body);

      saveToken(user.data!.token.toString());

      return user;
    } else {
      var errorMessage = jsonDecode(response.body);
      user.message = errorMessage["message"];
      return user;
    }
  }

  Future<void> Logout() async {
    await removeToken();
  }

  Future<UserLogin> register(UserCreateDto userCreate) async {
    final url = Uri.parse('$baseUrl/register');
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final body = jsonEncode({
      'email': userCreate.email,
      'password': userCreate.password,
      'password_confirmation': userCreate.passwordConfirmation,
      'name': userCreate.name,
    });

    final response = await http.post(url, headers: headers, body: body);
    final user = UserLogin();

    if (response.statusCode == 200) {
      final userData = userLoginFromJson(response.body);
      saveToken(userData.data!.token.toString());
      return userData;
    } else {
      final errorMessage = jsonDecode(response.body);
      user.message = errorMessage["message"];
      return user;
    }
  }

  Future<UserInfo> userInfo() async {
    var token = await getToken();

    final url = Uri.parse('$baseUrl/profile');

    final response = await http.get(url, headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    var user = UserInfo();
    if (response.statusCode == 200) {
      var user = userInfoFromJson(response.body);

      return user;
    } else {
      var errorMessage = jsonDecode(response.body);
      user.message = errorMessage["message"];
      return user;
    }
  }

  Future<bool> updateAvatar(XFile avatar) async {
    var token = await getToken();
    final url = Uri.parse('$baseUrl/profile/update-avatar');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer $token'
      ..headers['Accept'] = 'application/json';

    // Attach the image file
    if (avatar != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'user_image', // Field name expected by the backend
          avatar.path, // Path of the image file
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
}
