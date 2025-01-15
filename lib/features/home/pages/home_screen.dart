import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/dto/vetlist_dto.dart';
import 'package:petetco/commons/models/petlist_model.dart';
import 'package:petetco/commons/models/userinfo_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/loading_dialog.dart';
import 'package:petetco/features/auth/controllers/userinfo_provider.dart';
import 'package:petetco/features/bottom_bar.dart';
import 'package:petetco/commons/widget/head_list.dart';
import 'package:petetco/features/branch/pages/listbranch_screen.dart';
import 'package:petetco/features/onboarding/pages/onboarding_screen.dart';
import 'package:petetco/features/pet/controllers/pet_provider.dart';
import 'package:petetco/features/pet/pages/addpet_screen.dart';
import 'package:petetco/features/pet/widgets/petcard.dart';
import 'package:petetco/features/vet/controllers/vet_provider.dart';
import 'package:petetco/features/vet/pages/listvet_screen.dart';
import 'package:petetco/features/vet/widgets/vetcard.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  UserInfo? userInfo;
  bool isLoading = true; // Track if data is still being fetched
  PetList? petListInfo;
  VetListDto? vetListInfo;

  @override
  void initState() {
    super.initState();
    _checkStatus(); // Check user info before showing the screen
  }

  Future<void> _checkStatus() async {
    // Fetch user info asynchronously
    final res = await ref.read(userInfoStateProvider.notifier).userInfo();
    ref.read(userInfoStateProvider.notifier).setUserInfo(res);
    final petList = await ref.read(petStateProvider.notifier).getAllPet();
    final vetList = await ref.read(vetStateProvider.notifier).getAllVet();
    // Update state when data is fetched
    setState(() {
      userInfo = res;
      if (userInfo == null || userInfo?.data == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
        );
        return;
      }
      petListInfo = petList;
      vetListInfo = vetList;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
    if (isLoading) {
      return const LoadingDialog();
    }

    return Container(
      color: Styles.bgColor,
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.only(
              top: AppLayout.getHeight(30),
              left: AppLayout.getHeight(20),
              right: AppLayout.getHeight(20)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: Styles.headLineStyle3
                            .copyWith(color: Styles.grey600),
                      ),
                      Gap(AppLayout.getHeight(5)),
                      Text(
                        userInfo!.data!.name.toString(),
                        style: Styles.headLineStyleGreen1,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      BottomBar.mainPageKey.currentState?.navigateTo(2);
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                NetworkImage(userInfo!.data!.avatar.toString()),
                          )),
                    ),
                  )
                ],
              ),
              Gap(AppLayout.getHeight(40)),

              const HeadList(
                listText: "Our offer",
              ),

              Gap(AppLayout.getHeight(5)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/offer3.jpg",
                      width: 300,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Image.asset(
                      "assets/images/offer2.jpg",
                      width: 300,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Image.asset(
                      "assets/images/offer1.jpg",
                      width: 300,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Image.asset(
                      "assets/images/offer4.jpg",
                      width: 300,
                      height: 200,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),

              Gap(AppLayout.getHeight(30)),

              //Your pet
              HeadList(
                listText: "Your pets",
                isNotShow:
                    petListInfo?.data?.isNotEmpty ?? false ? false : true,
                onTap: () {
                  BottomBar.mainPageKey.currentState?.navigateTo(1);
                },
              ),
              Gap(AppLayout.getHeight(5)),
              petListInfo?.data?.isNotEmpty ?? false
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: petListInfo!.data!
                            .take(3)
                            .map((pet) => PetCard(
                                  e: pet,
                                  cardWidth: 350,
                                  padding: EdgeInsets.only(
                                      right: AppLayout.getHeight(10)),
                                ))
                            .toList(),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddPetScreen()));
                      },
                      child: Container(
                        width: 400,
                        height: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/addpet.png"),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [],
                          ),
                        ),
                      ),
                    ),

              Gap(AppLayout.getHeight(20)),

              //vet part
              HeadList(
                listText: "Vet list",
                isNotShow: false,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListBranchScreen()));
                },
              ),
              Gap(AppLayout.getHeight(5)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: vetListInfo!.data!
                      .take(3)
                      .map(
                        (vet) => VetCard(
                          vet: vet,
                          cardWidth: 300,
                          padding: const EdgeInsets.all(8.0),
                        ),
                      )
                      .toList(), // Convert the iterable to a list here
                ),
              ),

              Gap(AppLayout.getHeight(20)),

              //PetShop part
              const HeadList(
                listText: "Petshop list",
              ),
              Gap(AppLayout.getHeight(5)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/petshop1.jpg",
                      width: 300,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Image.asset(
                      "assets/images/petshop2.jpg",
                      width: 300,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Image.asset(
                      "assets/images/petshop3.jpg",
                      width: 300,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Image.asset(
                      "assets/images/petshop4.jpg",
                      width: 300,
                      height: 200,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),
              Gap(AppLayout.getHeight(30)),
            ],
          ),
        )
      ]),
    );
  }
}
