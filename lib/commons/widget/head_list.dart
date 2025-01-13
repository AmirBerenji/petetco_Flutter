import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_style.dart';

class HeadList extends StatelessWidget {
  const HeadList({
    super.key,
    required this.listText,
    this.onTap, this.isNotShow,
  });
  final String listText;
  final bool?  isNotShow;  
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          listText,
          style: Styles.headLineStyle3,
        ),
        const Spacer(),
        isNotShow ?? true?
        const Text("")
        :
        GestureDetector(
          onTap: onTap ,
          child: Text(
            "View all",
            style: Styles.headLineStyleGreen4,
          ),
        )
      ],
    );
  }
}
