import 'package:petetco/commons/models/colorList_model.dart';
import 'package:petetco/commons/models/petBreedList_model.dart';
import 'package:petetco/commons/models/petKindList_model.dart';
import 'package:petetco/commons/services/pet_info_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pet_info_provider.g.dart';

@riverpod
class PetInfoState extends _$PetInfoState {
  @override
  String build() {
    return "";
  }

  Future<KindList> getPeetKind() async {
    var kindList = await PetInfoService().getAllPetKind();

    return kindList;
  }

  Future<BreedList> getPetBreed(int id) async {
    var breedList = await PetInfoService().getAllPetBreed(id);

    return breedList;
  }

  Future<ColorList> getPetColor() async {
    var colorList = await PetInfoService().getAllPetColor();

    return colorList;
  }
}
