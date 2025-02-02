import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/dto/vet_dto.dart';
import 'package:petetco/commons/models/vet_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/loading_dialog.dart';
import 'package:petetco/features/branch/widgets/branchcard.dart';
import 'package:petetco/features/vet/controllers/vet_provider.dart';

class VetProfileScreen extends ConsumerStatefulWidget {
  const VetProfileScreen({super.key, required this.vet});

  final Vet vet;

  @override
  ConsumerState<VetProfileScreen> createState() => _VetProfileScreenState();
}

class _VetProfileScreenState extends ConsumerState<VetProfileScreen> {
  bool isLoading = true;
  VetDto? vetProfileInfo;

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    try {
      final vetProfile =
          await ref.read(vetStateProvider.notifier).getVet(widget.vet.id!);
      setState(() {
        vetProfileInfo = vetProfile;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load vet: $error')),
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
      body: Stack(
        children: [
          Image.network(
            widget.vet.cover ??
                "https://i.pinimg.com/736x/af/93/6b/af936bfab6e158877aea33e8bba5b589.jpg",
            width: double.infinity,
            height: 280,
            fit: BoxFit.cover,
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Styles.grey900),
              onPressed: () {
                Navigator.of(context).pop(); // Back navigation
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 230), // Avoid overlapping AppBar
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Styles.bgColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vetProfileInfo!.data!.name.toString(),
                          style: Styles.headLineStyleGreen2,
                        ),
                        const Gap(10),
                        Text(
                          vetProfileInfo!.data!.description!.toString(),
                          style: Styles.headLineStyle4,
                        ),
                        const Gap(10),
                        const Divider(),
                        Column(
                          children: vetProfileInfo!.data!.branches!
                              .map((b) => BranchCard(branch: b))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Styles.bgColor,
    );
  }
}
