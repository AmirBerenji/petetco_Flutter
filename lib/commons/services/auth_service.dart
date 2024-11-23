import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:petetco/commons/dto/editprofile_dto';
import 'package:petetco/commons/dto/userchangepassword_dto.dart';
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

  Future<bool> updatePassword(UserChangePasswordDto model) async {
    var token = await getToken();
    final url = Uri.parse('$baseUrl/profile/update-password');

    var request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer $token'
      ..headers['Accept'] = 'application/json';

    request.fields['current_password'] = model.currentPassword;
    request.fields['password'] = model.newPassword;
    request.fields['password_confirmation'] = model.confirmNewPassword;
    final response = await request.send();

    // Check the response status
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserInfo> editProfile(EditProfileDto model) async {
    var token = await getToken();
    final url = Uri.parse('$baseUrl/profile');

    Map<String, dynamic> payload = {
      'name': model.name ?? "N/A",
      'address_location': model.addressLocation != null
          ? model.addressLocation!.toJson()
          : {'lat': 0, 'lng': 0}, 
      'address': model.address ?? "N/A",
      'phone': model.phone ?? "N/A",
    };

    // Convert the payload to JSON
    String jsonPayload = json.encode(payload);

    // Send the POST request
    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type':
            'application/json', // Indicate that we're sending JSON data
      },
      body: jsonPayload,
    );

    // Check the response status
    if (response.statusCode == 200) {
      return new UserInfo();
    } else {
      return new UserInfo();
    }
  }
}
