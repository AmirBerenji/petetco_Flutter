
import 'package:petetco/commons/helper/shared_stroge.dart';



class BasicService{
  final String baseUrl = "https://petetco.maralamirkian.com/api";
  SharedStorage storage = SharedStorage();

  Future<bool> saveToken(String token) async {
    
    storage.saveValue('token', token);
    return true;
  }

  Future<String> getToken() async{
    var token = await storage.getValue('token');
    return token ?? "";
  }

}