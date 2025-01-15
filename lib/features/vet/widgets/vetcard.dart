import 'package:flutter/material.dart';
import 'package:petetco/commons/models/vet_model.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/vet/pages/vetprofile_screen.dart';

class VetCard extends StatelessWidget {
  const VetCard({
    super.key,
    required this.e,
    required this.cardWidth,
    required this.padding,
  });

  final Vet e;
  final double cardWidth;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VetProfileScreen(e: e)));
      },
      child: Padding(
        padding: padding,
        child: Container(
          width: cardWidth,
          height: 200,
          decoration: BoxDecoration(
            color: Styles.grey500,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(width: 1, color: Styles.bgPetBox),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image.network(
              e.cover ??
                  "https://i.pinimg.com/736x/af/93/6b/af936bfab6e158877aea33e8bba5b589.jpg",
              width: 300,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
