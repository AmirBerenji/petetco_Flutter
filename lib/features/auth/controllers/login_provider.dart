import 'package:petetco/commons/models/login_model.dart';
import 'package:petetco/commons/models/userlogin_model.dart';
import 'package:petetco/commons/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_provider.g.dart';

@riverpod
class LoginState extends _$LoginState {
  @override 
  String build(){
    return "";
  }

  Future<UserLogin> login(Login login) async{
    
    var userLogin = await AuthService().login(login);

    return userLogin;
  }


}