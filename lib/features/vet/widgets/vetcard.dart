import 'package:flutter/material.dart';
import 'package:petetco/commons/models/vet_model.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/vet/pages/vetprofile_screen.dart';

class VetCard extends StatelessWidget {
  const VetCard({
    super.key,
    required this.e,
  });

  final Vet e;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VetProfileScreen(e: e)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            color: Styles.grey500,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(width: 1, color: Styles.bgPetBox),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image.network(
              e.cover,
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
