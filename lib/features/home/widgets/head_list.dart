import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/bottom_bar.dart';

class HeadList extends StatelessWidget {
  const HeadList({
    super.key,
    required this.listText,
    this.onTap,
  });
  final String listText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          listText,
          style: Styles.headLineStyle2,
        ),
        const Spacer(),
        GestureDetector(
          child: Text(
            "View all",
            style: Styles.headLineStyleGreen4,
          ),
          onTap: onTap ,
        )
      ],
    );
  }
}
