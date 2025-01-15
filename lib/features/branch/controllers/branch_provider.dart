import 'package:petetco/commons/dto/branchlist_dto.dart';
import 'package:petetco/commons/services/branch_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'branch_provider.g.dart';

@riverpod
class BranchState extends _$BranchState {
  @override
  BranchListDto build() {
    return BranchListDto();
  }

  Future<BranchListDto> getAllBranch(Map<String, dynamic> data) async {
    var vetList = await BranchService().getAllBranch(data);
    state = vetList;
    return vetList;
  }
}
