import 'package:petetco/commons/dto/listpetcare_dto.dart';
import 'package:petetco/commons/models/petcare_model.dart';
import 'package:petetco/commons/services/petcare_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'petcare_provider.g.dart';

@riverpod
class PetCareState extends _$PetCareState {
  @override
  PetCare build() {
    return PetCare();
  }

  Future<ListPetCareDto> GetAllPetCare() async {
    var result = await  PetCareService().GetAllPetCare();
    return result;
  }
}
