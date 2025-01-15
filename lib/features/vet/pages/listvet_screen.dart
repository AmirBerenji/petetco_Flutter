import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/dto/vetlist_dto.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/loading_dialog.dart';
import 'package:petetco/features/vet/controllers/vet_provider.dart';
import 'package:petetco/features/vet/widgets/vetcard.dart';

class ListVetScreen extends ConsumerStatefulWidget {
  const ListVetScreen({super.key});

  @override
  ConsumerState<ListVetScreen> createState() => _ListVetScreenState();
}

class _ListVetScreenState extends ConsumerState<ListVetScreen> {
  bool isLoading = true;
  VetListDto? vetlistInfo;

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    try {
      final vetList = await ref.read(vetStateProvider.notifier).getAllVet();
      setState(() {
        vetlistInfo = vetList;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load vet list: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
    if (isLoading) {
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : vetlistInfo == null || vetlistInfo!.data == null
              ? const Center(child: Text('No data available'))
              : Padding(
                  padding: EdgeInsets.all(AppLayout.getHeight(10)),
                  child: ListView(
                    children: vetlistInfo!.data!
                        .map((vet) => VetCard(
                            e: vet,
                            cardWidth: 400,
                            padding: const EdgeInsets.only(bottom: 15)))
                        .toList(),
                  ),
                ),
    );
  }
}
