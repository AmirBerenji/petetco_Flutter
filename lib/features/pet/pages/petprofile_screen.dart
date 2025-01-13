import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/dto/listpetcare_dto.dart';
import 'package:petetco/commons/models/pet_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/head_list.dart';
import 'package:petetco/commons/widget/loading_dialog.dart';
import 'package:petetco/features/pet/controllers/petcare_provider.dart';
import 'package:petetco/features/pet/pages/petaddheight_screen.dart';
import 'package:petetco/features/pet/pages/petaddweight_screen.dart';
import 'package:petetco/features/pet/widgets/petcard.dart';
import 'package:petetco/features/pet/widgets/petcarecard.dart';

class PetProfileScreen extends ConsumerStatefulWidget {
  const PetProfileScreen({super.key, required this.e});

  final Pet e;

  @override
  ConsumerState<PetProfileScreen> createState() => _PetProfileScreenState();
}

class _PetProfileScreenState extends ConsumerState<PetProfileScreen>{
  bool isLoading = true;
  ListPetCareDto? listPetCare;

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    // Fetch user info asynchronously
    final petCareList =
        await ref.read(petCareStateProvider.notifier).GetAllPetCare();
    // Update state when data is fetched
    setState(() {
      listPetCare = petCareList;
      isLoading = false;
    });
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
        title: Text(widget.e.name.toString()),
        backgroundColor: Styles.bgColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppLayout.getHeight(10)),
        child: ListView(
          children: [
            Column(
              children: [
                PetCard(
                    isNotClick: true,
                    e: widget.e,
                    cardWidth: AppLayout.getWidth(400),
                    padding: EdgeInsets.all(AppLayout.getHeight(5))),
                Gap(AppLayout.getHeight(10)),
                const HeadList(
                  listText: "Current Situation",
                  isNotShow: true,
                ),
                Gap(AppLayout.getHeight(10)),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppLayout.getHeight(10),
                      right: AppLayout.getHeight(10)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PetAddWeightScreen(
                                        petId: widget.e.id!,
                                      )));
                        },
                        child: Container(
                          width: AppLayout.getWidth(170),
                          height: AppLayout.getHeight(150),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppLayout.getHeight(10))),
                              color: Styles.grey200,
                              border: Border.all(color: Styles.grey200)),
                          child: Column(
                            children: [
                              Gap(AppLayout.getHeight(15)),

                              Image.asset('assets/images/weight.png',fit: BoxFit.cover,width: 70,height: 70,),
                              
                              Gap(AppLayout.getHeight(15)),
                              Text(
                                'Weight:${widget.e.weight}',
                                style: Styles.headLineStyleGreen3,
                              )
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PetAddHeightScreen(
                                        petId: widget.e.id!,
                                      )));
                        },
                        child: Container(
                          width: AppLayout.getWidth(170),
                          height: AppLayout.getHeight(150),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppLayout.getHeight(10))),
                              color: Styles.grey200,
                              border: Border.all(color: Styles.grey200)),
                          child: Column(
                            children: [
                              Gap(AppLayout.getHeight(15)),
                              const Image(
                                image: AssetImage('assets/images/height.png'),
                                fit: BoxFit.cover,
                                width: 70,
                                height: 70,
                              ),
                              Gap(AppLayout.getHeight(15)),
                              Text(
                                'Height:${widget.e.height}',
                                style: Styles.headLineStyleGreen3,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Gap(AppLayout.getHeight(10)),
            const HeadList(
              listText: "Your Task",
              isNotShow: true,
            ),
            Gap(AppLayout.getHeight(10)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: listPetCare!.data!
                    .map((petcare) => PetCareCard(
                          image: Image.network(
                           petcare.cover.toString() ,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                          text: petcare.name ?? "",
                        ))
                        .take(4)
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
