import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/models/branch_model.dart';
import 'package:petetco/commons/utils/app_style.dart';

class BranchCard extends StatelessWidget {
  const BranchCard({
    super.key,
    required this.branch,
  });

  final Branch branch;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Styles.grey600, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (branch.vet?.name != null) // Corrected conditional syntax
            Text(
              branch.vet?.name ?? 'Unknown Vet',
              style: Styles.headLineStyleGreen2,
            ),
          const Gap(5),
          Text(branch.name ?? 'Unknown Name', style: Styles.headLineStyle3),
          const Gap(5),
          Text(branch.phone ?? 'Unknown Address', style: Styles.headLineStyle4),
          const Gap(5),
          Text(branch.email ?? 'Unknown Address', style: Styles.headLineStyle4),
          const Gap(5),
          Text(branch.address ?? 'Unknown Address',
              style: Styles.headLineStyle4),
        ],
      ),
    );
  }
}
