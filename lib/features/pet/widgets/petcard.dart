import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/models/pet_model.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/pet/pages/petprofile_screen.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    super.key,
    required this.e,
    required this.cardWidth,
    required this.padding,
    this.isNotClick = false,
  });

  final Pet e;
  final double cardWidth;
  final EdgeInsets padding;
  final bool? isNotClick ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isNotClick == false ) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PetProfileScreen(e: e)));
        }
      },
      child: Padding(
        padding: padding,
        child: Container(
          width: cardWidth,
          decoration: BoxDecoration(
              color: Styles.bgPetBox,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(width: 1, color: Styles.bgColor)),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(e.cover.toString()),
                            )),
                      ),
                      const Gap(30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Text(
                              e.name.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: Styles.headLineStyleGreen2,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Ionicons.md_calendar_outline,
                                  color: Styles.green900, size: 18),
                              const Gap(10),
                              Text(
                                e.dob.toString().substring(0, 10),
                                style: Styles.headLineStyleGreen3,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.pets,
                                  color: Styles.green900, size: 18),
                              const Gap(10),
                              Text(
                                e.breed!.name!.length >= 15
                                    ? "${e.breed!.name
                                            .toString()
                                            .substring(0, 15)}..."
                                    : e.breed!.name.toString(),
                                style: Styles.headLineStyleGreen3,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.color_lens,
                                color: Styles.green900,
                                size: 18,
                              ),
                              const Gap(10),
                              Text(
                                e.color!.name.toString(),
                                style: Styles.headLineStyleGreen3,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
