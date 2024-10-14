import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/commons/widget/custome_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
   final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
  final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
        child: Container(
                          decoration: BoxDecoration(
                  color: Colors.green.shade100
                ),
          child: Column(
          
            children: [
              SizedBox(
                width:AppLayout.getScreenWidth(),
                height: AppLayout.getScreenHeight() *0.5,
                child: 
                Padding(
                  padding: const EdgeInsets.only(top:30),
                  child: Lottie.asset(
                  'assets/icons/login_animation.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                              ),
                ),
              ),
          
              Container(
                width:AppLayout.getScreenWidth(),
                height: AppLayout.getScreenHeight() *0.5,
                decoration: BoxDecoration(
                  color: Styles.bgColor,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                  border: Border.all(width: 0.5, color: Styles.grey500),
                ),
                child: Padding(padding: EdgeInsets.only(top: AppLayout.getHeight(30)),
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: Styles.headLineStyle1,
                    ),
                    Gap(AppLayout.getHeight(30)),  
                    CustomTextField(hintText: "UserName/Email",
                      controller: user,
                      hintStyle: TextStyle(color: Styles.grey600),
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Ionicons.person_outline),),
                    Gap(AppLayout.getHeight(20)),
                    CustomTextField(hintText: "Password",
                      controller: password,
                      obscureText: true,
                      hintStyle: TextStyle(color: Styles.grey600),
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(Icons.key_rounded)),
                    Gap(AppLayout.getHeight(20)),
                    CustomButton(
                      width: AppLayout.getScreenWidth() * 0.9, 
                      height: AppLayout.getHeight(60), 
                      borderColor: Styles.green900,
                      color: Styles.green900,
                      text: Text(
                        "Login",
                        style: Styles.headLineStyle2.copyWith(color: Styles.grey100),
                        ) 
                      ),
                    Gap(AppLayout.getHeight(30)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){},
                            child: Text(
                              "Forgot password!",
                              style: Styles.headLineStyle3,),
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: Text(
                              "Create account",
                              style: Styles.headLineStyle3,),
                          ),
                      
                        ],
                      ),
                    )
                  ],
                ),
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}