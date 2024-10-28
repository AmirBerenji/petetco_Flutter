import 'package:petetco/commons/models/petKindList_model.dart';
import 'package:petetco/commons/services/pet_info_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pet_info_provider.g.dart';

@riverpod
class PetInfoState extends _$PetInfoState {
  @override 
  String build(){
    return "";
  }


  Future<KindList> getPeetKind() async {
    var kindList = await PetInfoService().getAllPetKind();

    return kindList;
  }

}