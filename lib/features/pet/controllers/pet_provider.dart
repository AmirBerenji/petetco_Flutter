import 'package:petetco/commons/dto/petAddWeight_dto.dart';
import 'package:petetco/commons/dto/petAdd_dto.dart';
import 'package:petetco/commons/models/petHeight_model.dart';
import 'package:petetco/commons/models/petWeight_model.dart';
import 'package:petetco/commons/models/petlist_model.dart';
import 'package:petetco/commons/services/pet_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pet_provider.g.dart';

@riverpod
class PetState extends _$PetState {
  @override
  PetList build() {
    return PetList();
  }

  Future<PetList> getAllPet() async {
    var petList = await PetService().getAllPet();
    state = petList;
    return petList;
  }

  Future<bool> addPet(PetAddDto petAdd) async {
    var result = await PetService().addPet(petAdd);
    return result;
  }

  Future<bool> addweight(PetWeightAddDto model) async {
    var result = await PetService().addPetWeight(model);
    return result;
  }

  Future<List<PetWeight>> getAllPetWeight(Map<String, dynamic> data) async {
    var result = await PetService().getPetWeight(data);
    if (result.data != null) {
      return result.data!.toList();
    }
    return [];
  }

  Future<bool> addHeight(PetWeightAddDto model) async {
    var result = await PetService().addPetHeight(model);
    return result;
  }

  Future<List<PetHeight>> getAllPetHeight(Map<String, dynamic> data) async {
    var result = await PetService().getPetHeight(data);
    if (result.data != null) {
      return result.data!.toList();
    }
    return [];
  }
}
