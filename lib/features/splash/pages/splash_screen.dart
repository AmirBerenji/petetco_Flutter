import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petetco/features/home/pages/home_screen.dart';
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const OnBoardingScreen()
        ));
    });
  
  
  }

@override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white,
              const Color.fromARGB(255, 86, 177, 115)],
              begin:Alignment.topRight,
              end: Alignment.bottomLeft),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(              
                width: 150,
                height: 150,
                //child: const Image(image: AssetImage('assets/icons/logo.png'),fit: BoxFit.contain,),
              )
            ],
          ),
        ),
        PictureAnimation()
        ],
      ),
    );
  }
}