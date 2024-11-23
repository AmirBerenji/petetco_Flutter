import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petetco/commons/models/userinfo_model.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/commons/widget/custom_btn.dart';
import 'package:petetco/commons/widget/loading_dialog.dart';
import 'package:petetco/features/auth/controllers/userinfo_provider.dart';
import 'package:petetco/features/auth/pages/changepassword_screen.dart';
import 'package:petetco/features/auth/pages/editprofile_screen.dart';
import 'package:petetco/features/auth/pages/login_screen.dart';
import 'package:petetco/features/auth/widgets/custom_profile_label.dart';
import 'package:petetco/features/onboarding/pages/onboarding_screen.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>  with TickerProviderStateMixin{
  final ImagePicker _picker = ImagePicker();
  UserInfo? userInfo;
  bool isLoading = true;
  XFile? imageSource;

  Future<void> setPicPath(ImageSource imgSource) async {
    final XFile? pickedFile = await _picker.pickImage(source: imgSource);
    if (pickedFile != null) {
      setState(() {
        imageSource = pickedFile;
      });
      await ref.read(userInfoStateProvider.notifier).updateAvatar(pickedFile);
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _checkStatus(); // Check user info before showing the screen
  }

  Future<void> _checkStatus() async {
    final res = await ref.read(userInfoStateProvider.notifier).userInfo();
    setState(() {
      userInfo = res;
      if (userInfo == null || userInfo?.data == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
        );
        return;
      }
      isLoading = false;
    });
  }

  ImageProvider<Object> _checkImage() {
    if (imageSource?.path != null) {
      return FileImage(File(imageSource!.path));
    } else if (userInfo!.data!.avatar != null) {
      return NetworkImage(userInfo!.data!.avatar!.toString());
    } else {
      return const AssetImage("assets/images/splash1.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);

    if (isLoading) {
      return const LoadingDialog();
    }

    return Scaffold(
        backgroundColor: Styles.bgColor,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: AppLayout.getHeight(40),
                  left: AppLayout.getHeight(110),
                  right: AppLayout.getHeight(110)),
              child: Container(
                width: 150,
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppLayout.getHeight(200))),
                    border: Border.all(width: 1, color: Styles.grey500),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: _checkImage())),
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: AppLayout.getHeight(15),
                        bottom: AppLayout.getHeight(15)),
                    child: Container(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.edit_square,
                          color: Styles.green900,
                          size: 30,
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        body: Column(
                          children: [
                            Gap(AppLayout.getHeight(10)),
                            CustomButton(
                              icon: const Icon(Icons.photo_album_sharp),
                              width: 250,
                              height: 50,
                              borderColor: Styles.grey600,
                              color: Styles.grey400,
                              text: Text(
                                "Gallery",
                                style: Styles.headLineStyle3,
                              ),
                              onTap: () async {
                                await setPicPath(ImageSource.gallery);
                              },
                            ),
                            Gap(AppLayout.getHeight(10)),
                            CustomButton(
                              icon: const Icon(Icons.camera_enhance),
                              width: 250,
                              height: 50,
                              borderColor: Styles.grey600,
                              color: Styles.grey400,
                              text: Text(
                                "Camera",
                                style: Styles.headLineStyle3,
                              ),
                              onTap: () async {
                                await setPicPath(ImageSource.camera);
                              },
                            )
                          ],
                        ),
                        dialogType: DialogType.noHeader,
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 30, top: 0),
                      ).show();
                    },
                  ),
                ]),
              ),
            ),
            Container(
              padding: EdgeInsets.all(AppLayout.getHeight(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomeLableAndVal(
                    lable: "Name: ",
                    val: userInfo?.data?.name ?? "N/A",
                  ),
                  Gap(AppLayout.getHeight(10)),
                  CustomeLableAndVal(
                    lable: "Email: ",
                    val: userInfo?.data?.email ?? "N/A",
                  ),
                  Gap(AppLayout.getHeight(10)),
                  CustomeLableAndVal(
                    lable: "Phone: ",
                    val: userInfo?.data?.phone ?? "N/A",
                  ),
                  Gap(AppLayout.getHeight(10)),
                  CustomeLableAndVal(
                    lable: "Address: ",
                    val: userInfo?.data?.address ?? "N/A",
                  ),
                  Gap(AppLayout.getHeight(40)),
                  Text(
                    "Setting",
                    style: Styles.headLineStyle4.copyWith(
                        fontWeight: FontWeight.bold, color: Styles.grey700),
                  ),
                  const Divider(),
                  Gap(AppLayout.getHeight(10)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordScreen()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.password,
                          color: Styles.grey800,
                        ),
                        Gap(AppLayout.getHeight(10)),
                        Text(
                          "Change Password",
                          style: Styles.headLineStyle3
                              .copyWith(color: Styles.grey800),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Styles.grey800,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  Gap(AppLayout.getHeight(30)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfileScreen()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Styles.grey800,
                        ),
                        Gap(AppLayout.getHeight(10)),
                        Text(
                          "Update Profile Info",
                          style: Styles.headLineStyle3
                              .copyWith(color: Styles.grey800),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Styles.grey800,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  Gap(AppLayout.getHeight(30)),
                  GestureDetector(
                    onTap: () async {
                      await ref
                          .read(userInfoStateProvider.notifier)
                          .logoutProfile();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Styles.errorRed,
                        ),
                        Gap(AppLayout.getHeight(10)),
                        Text(
                          "Logout",
                          style: Styles.headLineStyle3
                              .copyWith(color: Styles.errorRed),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Styles.errorRed,
                          size: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
