import 'package:petetco/commons/dto/vet_dto.dart';
import 'package:petetco/commons/dto/vetlist_dto.dart';
import 'package:petetco/commons/services/vet_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'vet_provider.g.dart';

@riverpod
class VetState extends _$VetState {
  @override
  VetListDto build() {
    return VetListDto();
  }

  Future<VetListDto> getAllVet() async {
    var vetList = await VetService().getAllVet();
    state = vetList;
    return vetList;
  }

  Future<VetDto> getVet(int id) async {
    var vetDto = await VetService().getVet(id);
    return vetDto;
  }
}
