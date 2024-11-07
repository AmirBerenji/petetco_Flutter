import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_style.dart';

class CustomeLableAndVal extends StatelessWidget {
  final String lable;
  final String val;

  const CustomeLableAndVal({
    super.key,
    required this.lable,
    required this.val,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          lable,
          style: Styles.headLineStyle3,
        ),
        Text(
          val,
          style: Styles.headLineStyleGreen3,
        ),
      ],
    );
  }
}