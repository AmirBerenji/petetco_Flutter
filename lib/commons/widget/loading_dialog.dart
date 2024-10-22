import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/utils/app_style.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Center
      (child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitFadingGrid(
            color: Styles.green900,
            
          ),
          
            const Gap(10),
            Text(
              "Please wait....",
              style: Styles.headLineStyle3,
              )
        ],
      )
        ),
    );
  }
}
