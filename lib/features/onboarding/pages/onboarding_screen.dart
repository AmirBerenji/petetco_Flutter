import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/onboarding/widgets/page_one.dart';
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
    final size = AppLayout.getSize(context);
    return  Scaffold(
      body:Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              PageOne(),
              PageTwo(),
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
                          print("Hello");
                          pageController.nextPage(duration: const Duration(microseconds: 600), 
                          curve: Curves.ease);
                        },
                        child: const Icon(Ionicons.chevron_forward_circle,
                        size: 30,
                        color: Colors.red,),
                      ),
                      Gap(AppLayout.getHeight(5)),
                      Text(
                        "Skip",
                        style: Styles.headLineStyle4,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      pageController.nextPage(duration: const Duration(microseconds: 600), 
                          curve: Curves.ease);
                    },
                    child: SmoothPageIndicator(
                      controller: pageController, 
                      count: 2,
                      effect: const WormEffect(
                        dotHeight: 12,
                        dotWidth: 16,
                        spacing: 10,
                      ),),
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