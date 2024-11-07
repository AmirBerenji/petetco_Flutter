
import 'package:image_picker/image_picker.dart';
import 'package:petetco/commons/models/userinfo_model.dart';
import 'package:petetco/commons/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'userinfo_provider.g.dart';

@riverpod
class UserInfoState extends _$UserInfoState {
  @override 
  UserInfo build(){
    
    return new UserInfo();
  }

  Future<UserInfo> userInfo() async{  
    var user = await AuthService().userInfo();
    return user;
  }

  Future<bool> updateAvatar(XFile avatar) async {
      var result  = await AuthService().updateAvatar(avatar);
    return result;
  }


}