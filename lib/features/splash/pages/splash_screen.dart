import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petetco/features/home/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
    with SingleTickerProviderStateMixin{

      @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);


    // Future.delayed(const Duration(seconds: 2),(){
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (_) => const HomeScreen()
    //     ));
    // });
  
  
  }

@override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.deepOrange.shade300],
            begin:Alignment.topRight,
            end: Alignment.bottomLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(              
              width: 110,
              height: 110,
              child: const Image(image: AssetImage('assets/icons/logo.png'),fit: BoxFit.contain,),
            )
          ],
        ),
      ),
    );
  }
}