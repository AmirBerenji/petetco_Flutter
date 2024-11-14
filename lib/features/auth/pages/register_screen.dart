import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:petetco/commons/dto/usercreate_dto.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/commons/widget/custome_dialog.dart';
import 'package:petetco/commons/widget/custome_textfield.dart';
import 'package:petetco/features/auth/controllers/register_provider.dart';
import 'package:petetco/features/auth/pages/login_screen.dart';
import 'package:petetco/features/bottom_bar.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends ConsumerState<RegisterScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _password_confirmation = TextEditingController();
  final TextEditingController _name = TextEditingController();

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
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Lottie.asset(
                    'assets/icons/register_animation.json',
                    width: 550,
                    height: 550,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Container(
                width: 700,
                height: 500,
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
                        "Create new account",
                        style: Styles.headLineStyle1,
                      ),
                      const Gap(30),
                      CustomTextField(
                        hintText: "Full Name",
                        controller: _name,
                        hintStyle: TextStyle(color: Styles.grey600),
                        keyboardType: TextInputType.name,
                        suffixIcon: const Icon(Ionicons.person_outline),
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap(10),
                      CustomTextField(
                        hintText: "Email",
                        controller: _email,
                        hintStyle: TextStyle(color: Styles.grey600),
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: const Icon(Icons.email),
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap(10),
                      CustomTextField(
                          hintText: "Password",
                          controller: _password,
                          obscureText: true,
                          hintStyle: TextStyle(color: Styles.grey600),
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: const Icon(Icons.lock),
                          textInputAction: TextInputAction.next),
                      const Gap(10),
                      CustomTextField(
                          hintText: "Confirm Password",
                          controller: _password_confirmation,
                          obscureText: true,
                          hintStyle: TextStyle(color: Styles.grey600),
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: const Icon(Icons.lock),
                          textInputAction: TextInputAction.done),
                      const Gap(10),
                      CustomButton(
                          onTap: () async {
                            if (_email.text.isNotEmpty &&
                                _name.text.isNotEmpty &&
                                _password_confirmation.text.isNotEmpty &&
                                _password.text.isNotEmpty) {
                              if (_password.text !=
                                  _password_confirmation.text) {
                                CustomAwesomeDialog(
                                        context,
                                        "Password and Confirm Password is not equal!",
                                        DialogType.error)
                                    .show();
                                return;
                              }

                              var user = UserCreateDto(
                                  email: _email.text,
                                  password: _password.text,
                                  passwordConfirmation:
                                      _password_confirmation.text,
                                  name: _name.text);

                              var userInfo = await ref
                                  .read(registerStateProvider.notifier)
                                  .register(user);

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
                            "Register",
                            style: Styles.headLineStyle2
                                .copyWith(color: Styles.grey100),
                          )),
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: Text(
                                "I have account",
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
