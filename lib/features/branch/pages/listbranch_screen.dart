import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/dto/branchlist_dto.dart';
import 'package:petetco/commons/models/branch_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/loading_dialog.dart';
import 'package:petetco/features/branch/controllers/branch_provider.dart';

class ListBranchScreen extends ConsumerStatefulWidget {
  const ListBranchScreen({super.key});

  @override
  ConsumerState<ListBranchScreen> createState() => _ListBranchScreenState();
}

class _ListBranchScreenState extends ConsumerState<ListBranchScreen> {
  bool isInitialLoading = true;
  bool isPaginationLoading = false;
  BranchListDto? branchListInfo;
  List<Branch> branches = [];
  int fetchPage = 1;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _checkStatus(fetchPage);
    scrollController.addListener(loadMore);
  }

  void loadMore() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (branchListInfo != null &&
          branchListInfo!.pagination != null &&
          branchListInfo!.pagination!.total != null &&
          branches.length < branchListInfo!.pagination!.total!) {
        _checkStatus(fetchPage + 1);
      }
    }
  }

  Future<void> _checkStatus(int page) async {
    try {
      if (page == 1) {
        setState(() {
          isInitialLoading = true;
        });
      } else {
        setState(() {
          isPaginationLoading = true;
        });
      }

      Map<String, dynamic> data = {"page": page};
      final branchList =
          await ref.read(branchStateProvider.notifier).getAllBranch(data);

      setState(() {
        branchListInfo = branchList;
        branches.addAll(branchList.data!);
        fetchPage = page;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load vet list: $error')),
      );
    } finally {
      setState(() {
        if (page == 1) {
          isInitialLoading = false;
        } else {
          isPaginationLoading = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);

    if (isInitialLoading) {
      return const LoadingDialog();
    }

    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        title: Text(
          "List of vet",
          style: Styles.headLineStyle3,
        ),
        backgroundColor: Styles.bgColor,
      ),
      body: branches.isEmpty
          ? const Center(child: Text('No data available'))
          : Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: branches.length,
                      itemBuilder: (context, index) {
                        final p = branches[index];
                        return Container(
                          height: 140,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border:
                                  Border.all(color: Styles.grey600, width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p.vet!.name!.toString(),
                                style: Styles.headLineStyleGreen2,
                              ),
                              Gap(5),
                              Text(p.name!.toString(),
                                  style: Styles.headLineStyle3),
                              Gap(5),
                              Text(p.address!.toString(),
                                  style: Styles.headLineStyle4)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  if (isPaginationLoading)
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: Styles.green900,
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
