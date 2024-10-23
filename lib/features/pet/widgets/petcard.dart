
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/models/pet_model.dart';
import 'package:petetco/commons/utils/app_style.dart';

class PetCard extends StatelessWidget {
  const PetCard( {
    super.key, required this.e, required this.cardWidth, required this.padding, 
  });

  final Pet e;
  final double cardWidth;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
                      padding: padding,
                      child: Container(
                        width: cardWidth,
                        decoration: BoxDecoration(
                          color: Styles.bgPetBox,
                          borderRadius: const BorderRadius.all(Radius.circular(15))
                        ),
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
                                            ) 
                                        ),
                                      ), 
                                  const Gap(30),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.name.toString(),
                                        style: Styles.headLineStyleGreen2,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Ionicons.md_calendar_outline,color:Styles.green900,size: 18),
                                            const Gap(10),
                                            Text(
                                            e.dob.toString().substring(0,10),
                                            style: Styles.headLineStyleGreen3,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.pets,color:Styles.green900,size: 18),
                                            const Gap(10),
                                            Text(
                                            e.breed!.name.toString().substring(0,10),
                                            style: Styles.headLineStyleGreen3,
                                            ),
                                          ],
                                        ),
                                        Row(
                                            children: [
                                              Icon(Icons.color_lens,color: Styles.green900,size: 18,),
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
                          )
                        ),
                      ),
                    );
  }
}