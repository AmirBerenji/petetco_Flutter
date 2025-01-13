import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/features/auth/pages/login_screen.dart';
import 'package:petetco/features/auth/pages/register_screen.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(children: [
        const Image(
          image: AssetImage("assets/images/page3.jpg"),
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Column(
          children: [
            SizedBox(
              width: AppLayout.getScreenWidth(),
              height: AppLayout.getScreenHeight() * 0.6,
            ),
            Container(
                width: AppLayout.getScreenWidth(),
                height: AppLayout.getScreenHeight() * 0.4,
                decoration: BoxDecoration(
                  color: Styles.green900,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppLayout.getHeight(150))),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      right: AppLayout.getHeight(30),
                      left: AppLayout.getHeight(30),
                      top: AppLayout.getHeight(5)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          "Sign in to continue.",
                          style: Styles.headLineStyle3
                              .copyWith(color: Styles.grey100),
                        ),
                      ),
                      Gap(AppLayout.getHeight(20)),
                      CustomButton(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        width: AppLayout.getScreenWidth() * 0.8,
                        height: AppLayout.getHeight(60),
                        borderColor: Styles.grey200,
                        text: Text(
                          "Login",
                          style: Styles.headLineStyle3
                              .copyWith(color: Styles.grey100),
                        ),
                        color: Styles.orange800,
                      ),
                      Gap(AppLayout.getHeight(15)),
                      CustomButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                        },
                        width: AppLayout.getScreenWidth() * 0.8,
                        height: AppLayout.getHeight(60),
                        borderColor: Styles.grey200,
                        text: Text(
                          "Create Account",
                          style: Styles.headLineStyle3
                              .copyWith(color: Styles.grey100),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ]),
    );
  }
}
