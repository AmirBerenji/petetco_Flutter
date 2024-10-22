import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/auth/pages/login_screen.dart';
import 'package:petetco/features/onboarding/widgets/page_one.dart';
import 'package:petetco/features/onboarding/widgets/page_three.dart';
import 'package:petetco/features/onboarding/widgets/page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  @override
  void dispose()
  {
    pageController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
    return  Scaffold(
      body:Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              PageOne(),
              PageTwo(),
              PageThree()
            ],),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20),vertical: AppLayout.getWidth(30) ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          pageController.nextPage(duration: const Duration(milliseconds: 600), 
                          curve: Curves.ease);
                        },
                        child: Icon(Ionicons.chevron_forward_circle,
                        size: 30,
                        color: Styles.orangeButton,),
                      ),
                      Gap(AppLayout.getHeight(10)),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                        "Skip",
                        style: Styles.headLineStyle3.copyWith(color: Styles.grey100),
                          ),
                      ),
                      
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      pageController.nextPage(duration: const Duration(microseconds: 600), 
                          curve: Curves.ease);
                    },
                    child: SmoothPageIndicator(

                      controller: pageController, 
                      count: 3,
                      effect: WormEffect(
                        activeDotColor: Styles.orangeButton,
                        dotHeight: 15,
                        dotWidth: 15,
                        spacing: 10,
                      ),
                      ),
                  )
                ],
              ),
              ),
          ),
        ],
      )
    );
  }
}