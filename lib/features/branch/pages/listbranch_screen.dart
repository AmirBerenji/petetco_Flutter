import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/dto/branchlist_dto.dart';
import 'package:petetco/commons/models/branch_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custome_paginationloader.dart';
import 'package:petetco/commons/widget/loading_dialog.dart';
import 'package:petetco/features/branch/controllers/branch_provider.dart';
import 'package:petetco/features/branch/widgets/branchcard.dart';

class ListBranchScreen extends ConsumerStatefulWidget {
  const ListBranchScreen({super.key});

  @override
  ConsumerState<ListBranchScreen> createState() => _ListBranchScreenState();
}

class _ListBranchScreenState extends ConsumerState<ListBranchScreen> {
  bool _isInitialLoading = true;
  bool _isPaginationLoading = false;
  BranchListDto? _branchListInfo;
  final List<Branch> _branches = [];
  int _currentPage = 1;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchBranches(_currentPage);
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreBranches();
    }
  }

  Future<void> _fetchBranches(int page) async {
    try {
      _setLoadingState(page);

      final data = {"page": page};
      final branchList =
          await ref.read(branchStateProvider.notifier).getAllBranch(data);

      setState(() {
        _branchListInfo = branchList;
        _branches.addAll(branchList.data!);
        _currentPage = page;
      });
    } catch (error) {
      _showErrorSnackBar(error.toString());
    } finally {
      _clearLoadingState(page);
    }
  }

  void _setLoadingState(int page) {
    setState(() {
      if (page == 1) {
        _isInitialLoading = true;
      } else {
        _isPaginationLoading = true;
      }
    });
  }

  void _clearLoadingState(int page) {
    setState(() {
      if (page == 1) {
        _isInitialLoading = false;
      } else {
        _isPaginationLoading = false;
      }
    });
  }

  void _loadMoreBranches() {
    if (_branchListInfo != null &&
        _branchListInfo!.pagination != null &&
        _branchListInfo!.pagination!.total != null &&
        _branches.length < _branchListInfo!.pagination!.total!) {
      _fetchBranches(_currentPage + 1);
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to load branches: $message')),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);

    if (_isInitialLoading) {
      return const LoadingDialog();
    }

    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: _buildAppBar(),
      body: _branches.isEmpty
          ? const Center(child: Text('No data available'))
          : _buildBranchList(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "List of Vets",
        style: Styles.headLineStyle3,
      ),
      backgroundColor: Styles.bgColor,
    );
  }

  Widget _buildBranchList() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: _branches.length,
              itemBuilder: (context, index) {
                final branch = _branches[index];
                return BranchCard(branch: branch);
              },
            ),
          ),
          if (_isPaginationLoading) const PaginationLoader(),
        ],
      ),
    );
  }
}
