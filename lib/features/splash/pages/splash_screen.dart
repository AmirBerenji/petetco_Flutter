import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/onboarding/pages/onboarding_screen.dart';
import 'package:petetco/features/splash/widgets/picture_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
    with SingleTickerProviderStateMixin{

      @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const OnBoardingScreen()
        ));
    });
  
  
  }

@override
  void dispose() {
   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      body: Stack(
        children: [
         Container(
          width: 500,
          
          child:Column(
            children: [
              Container(
                width:500,
                height: 530,
                decoration: BoxDecoration(
                color: Styles.green900,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(150)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome",style: Styles.headLineStyle1.copyWith(color: Styles.grey100,fontSize: 50)),
                    Gap(10),
                    Text("to",style: Styles.headLineStyle1.copyWith(color: Styles.grey100,fontSize: 40)),
                    Gap(10),
                    Text("PETET CO",style: Styles.headLineStyle1.copyWith(color: Styles.grey100,fontSize: 60)),
                  ],
                ),
              ),
              
            ],
          ) 
          ,
         ),
         
       
        PictureAnimation()
        ],
      ),
    );
  }
}