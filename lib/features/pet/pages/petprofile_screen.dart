import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:petetco/commons/models/pet_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/head_list.dart';
import 'package:petetco/features/pet/pages/petaddheight_screen.dart';
import 'package:petetco/features/pet/pages/petaddweight_screen.dart';
import 'package:petetco/features/pet/widgets/petcard.dart';

class PetProfileScreen extends StatelessWidget {
  const PetProfileScreen({super.key, required this.e});

  final Pet e;

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      appBar: AppBar(
        title: Text(e.name.toString()),
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
                    e: e,
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
                                        petId: e.id!,
                                      )));
                        },
                        child: Container(
                          width: AppLayout.getWidth(170),
                          height: AppLayout.getHeight(150),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/scales2.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppLayout.getHeight(10))),
                              color: Styles.grey400,
                              border: Border.all(color: Styles.grey200)),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PetAddHeightScreen(
                                        petId: e.id!,
                                      )));
                        },
                        child: Container(
                          width: AppLayout.getWidth(170),
                          height: AppLayout.getHeight(150),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/meter.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Styles.grey400,
                              border: Border.all(color: Styles.grey200)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
