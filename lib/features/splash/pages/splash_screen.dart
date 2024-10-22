import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/helper/shared_stroge.dart';
import 'package:petetco/commons/models/login_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/auth/controllers/userinfo_provider.dart';
import 'package:petetco/features/auth/pages/login_screen.dart';
import 'package:petetco/features/bottom_bar.dart';
import 'package:petetco/features/home/pages/home_screen.dart';
import 'package:petetco/features/onboarding/pages/onboarding_screen.dart';
import 'package:petetco/features/splash/widgets/picture_animation.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> 
    with SingleTickerProviderStateMixin{

      @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SharedStorage storage  = new SharedStorage();
    Future.delayed(const Duration(seconds: 3),() async {

        // var token = await storage.getValue('token');

        // if(token == null ) { 
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (_) => const OnBoardingScreen()
        //   ));
        //   return;
        // }
        
        // var user = await ref.read(userInfoStateProvider.notifier).userInfo();

        // if(user.data == null)
        // {
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (_) => const OnBoardingScreen()
        //   ));
          
        // }else{
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (_) => const HomeScreen()
        //   ));
        // }



        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => const BottomBar()
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
    
    AppLayout.getSize(context);
    
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