
import 'package:petetco/commons/models/userinfo_model.dart';
import 'package:petetco/commons/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'userinfo_provider.g.dart';

@riverpod
class UserInfoState extends _$UserInfoState {
  @override 
  String build(){
    return "";
  }

  Future<UserInfo> userInfo() async{
    
    var user = await AuthService().userInfo();

    return user;
  }


}