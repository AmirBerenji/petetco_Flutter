import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/dto/branchlist_dto.dart';
import 'package:petetco/commons/models/branch_model.dart';

class BranchState {
  final bool isInitialLoading;
  final bool isPaginationLoading;
  final BranchListDto? branchListInfo;
  final List<Branch> branches;
  final int currentPage;

  const BranchState({
    this.isInitialLoading = true,
    this.isPaginationLoading = false,
    this.branchListInfo,
    this.branches = const [],
    this.currentPage = 1,
  });

  BranchState copyWith({
    bool? isInitialLoading,
    bool? isPaginationLoading,
    BranchListDto? branchListInfo,
    List<Branch>? branches,
    int? currentPage,
  }) {
    return BranchState(
      isInitialLoading: isInitialLoading ?? this.isInitialLoading,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      branchListInfo: branchListInfo ?? this.branchListInfo,
      branches: branches ?? this.branches,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class BranchNotifier extends StateNotifier<BranchState> {
  BranchNotifier() : super(const BranchState());

  Future<void> fetchBranches(int page, Function(String) onError) async {
    try {
      if (page == 1) {
        state = state.copyWith(isInitialLoading: true);
      } else {
        state = state.copyWith(isPaginationLoading: true);
      }

      final data = {"page": page};
      // Replace this with your actual API call
      final branchList = await getAllBranch(data);

      state = state.copyWith(
        branchListInfo: branchList,
        branches: page == 1
            ? branchList.data!
            : [...state.branches, ...branchList.data!],
        currentPage: page,
      );
    } catch (error) {
      onError(error.toString());
    } finally {
      state = state.copyWith(
        isInitialLoading: false,
        isPaginationLoading: false,
      );
    }
  }

  Future<BranchListDto> getAllBranch(Map<String, dynamic> data) async {
    // Mock API call
    throw UnimplementedError('Implement the actual API call here.');
  }
}

final branchStateProvider =
    StateNotifierProvider<BranchNotifier, BranchState>((ref) {
  return BranchNotifier();
});
