import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:petetco/commons/dto/userchangepassword_dto.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/commons/widget/custome_dialog.dart';
import 'package:petetco/commons/widget/custome_textfield.dart';
import 'package:petetco/features/auth/controllers/userinfo_provider.dart';
import 'package:petetco/features/auth/pages/login_screen.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmNewPassword = TextEditingController();
  // Future<bool> getData() async {
  //   var xx = await ref.read(userInfoStateProvider).data;
  //   print(xx?.name);
  //   return true;
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   getData();
  // }

  Future<void> updatePassword() async {
    if (_currentPassword.text.trim().isEmpty ||
        _newPassword.text.trim().isEmpty ||
        _confirmNewPassword.text.trim().isEmpty) {
      CustomAwesomeDialog(context, "Please fill all data", DialogType.warning)
          .show();
    } else if (_newPassword.text != _confirmNewPassword.text) {
      CustomAwesomeDialog(context, "New password and confirm is not match",
              DialogType.warning)
          .show();
    } else {
      var model = UserChangePasswordDto();
      model.currentPassword = _currentPassword.text;
      model.newPassword = _newPassword.text;
      model.confirmNewPassword = _confirmNewPassword.text;

      var result =
          await ref.read(userInfoStateProvider.notifier).updatePassword(model);

      if (result) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      } else {
        CustomAwesomeDialog(context, "Please try later", DialogType.error)
            .show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
      ),
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.green.shade100),
          child: Column(
            children: [
              SizedBox(
                width: 340,
                height: 330,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Lottie.asset(
                    'assets/icons/changepassword_animation.json',
                    width: 700,
                    height: 700,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 700,
                height: 450,
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
                        "Change Password",
                        style: Styles.headLineStyle1,
                      ),
                      const Gap(30),
                      CustomTextField(
                        hintText: "Current Password",
                        controller: _currentPassword,
                        obscureText: true,
                        hintStyle: TextStyle(color: Styles.grey600),
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: const Icon(Icons.lock),
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap(20),
                      CustomTextField(
                        hintText: "New Password",
                        controller: _newPassword,
                        obscureText: true,
                        hintStyle: TextStyle(color: Styles.grey600),
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: const Icon(Icons.lock_outline),
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap(20),
                      CustomTextField(
                          hintText: "Confirm New Password",
                          controller: _confirmNewPassword,
                          obscureText: true,
                          hintStyle: TextStyle(color: Styles.grey600),
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: const Icon(Icons.lock_outlined),
                          textInputAction: TextInputAction.done),
                      const Gap(20),
                      CustomButton(
                          onTap: () async {await updatePassword();},
                          width: 380,
                          height: 50,
                          borderColor: Styles.green900,
                          color: Styles.green900,
                          text: Text(
                            "Change Password",
                            style: Styles.headLineStyle2
                                .copyWith(color: Styles.grey100),
                          )),
                      const Gap(30),
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
