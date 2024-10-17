import 'package:petetco/commons/models/usercreate_model.dart';
import 'package:petetco/commons/models/userlogin_model.dart';
import 'package:petetco/commons/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_provider.g.dart';

@riverpod
class RegisterState extends _$RegisterState {
  @override 
  String build(){
    return "";
  }

  Future<UserLogin> register(UserCreate register) async{
    
    var userLogin = await AuthService().register(register);

    return userLogin;
  }


}