import 'package:petetco/commons/models/petlist_model.dart';
import 'package:petetco/commons/services/pet_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pet_provider.g.dart';

@riverpod
class PetState extends _$PetState {
  @override 
  String build(){
    return "";
  }


  Future<PetList> getAllPet() async {
    var petList = await PetService().getAllPet();

    return petList;
  }

  Future<bool> addPet() async{
    return true;
  }

}