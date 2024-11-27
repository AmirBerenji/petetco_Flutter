import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/utils/app_style.dart';

class PetCareCard extends StatelessWidget {
  const PetCareCard({
    super.key, required this.text,  required this.image,
  });

  final String text;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              color: Styles.grey200,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 1,color: Styles.grey100)
              ),
              
          child: Column(
            children: [
              Gap(10),
              image,
              Gap(10),
              Text(text,style: Styles.headLineStyleGreen3,)
            ],
          ),
        ),
        Gap(10)
      ],
    );
  }
}
