import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:petetco/commons/models/login_model.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/commons/widget/custome_dialog.dart';
import 'package:petetco/commons/widget/custome_textfield.dart';
import 'package:petetco/features/auth/controllers/login_provider.dart';
import 'package:petetco/features/auth/pages/register_screen.dart';
import 'package:petetco/features/bottom_bar.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends ConsumerState<LoginScreen> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.green.shade100),
          child: Column(
            children: [
              SizedBox(
                width: 700,
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Lottie.asset(
                    'assets/icons/login_animation.json',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 700,
                height: 400,
                decoration: BoxDecoration(
                  color: Styles.bgColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  border: Border.all(width: 0.5, color: Styles.grey500),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: Styles.headLineStyle1,
                      ),
                      const Gap(30),
                      CustomTextField(
                        hintText: "UserName/Email",
                        controller: _user,
                        hintStyle: TextStyle(color: Styles.grey600),
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: const Icon(Ionicons.person_outline),
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap(20),
                      CustomTextField(
                          hintText: "Password",
                          controller: _password,
                          obscureText: true,
                          hintStyle: TextStyle(color: Styles.grey600),
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: const Icon(Icons.lock),
                          textInputAction: TextInputAction.done),
                      const Gap(20),
                      CustomButton(
                          onTap: () async {
                            if (_user.text.isNotEmpty &&
                                _password.text.isNotEmpty) {
                              var loginModel = Login(
                                  email: _user.text, password: _password.text);
                              var userInfo = await ref
                                  .read(loginStateProvider.notifier)
                                  .login(loginModel);

                              if (userInfo.data?.token != null) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomBar()));
                              } else {
                                CustomAwesomeDialog(
                                        context,
                                        userInfo.message.toString(),
                                        DialogType.warning)
                                    .show();
                              }
                            } else {
                              CustomAwesomeDialog(context,
                                      "Please fill all data", DialogType.error)
                                  .show();
                            }
                          },
                          width: 380,
                          height: 50,
                          borderColor: Styles.green900,
                          color: Styles.green900,
                          text: Text(
                            "Login",
                            style: Styles.headLineStyle2
                                .copyWith(color: Styles.grey100),
                          )),
                      const Gap(30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Forgot password!",
                                style: Styles.headLineStyle4,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()));
                              },
                              child: Text(
                                "Create account",
                                style: Styles.headLineStyle4,
                              ),
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
