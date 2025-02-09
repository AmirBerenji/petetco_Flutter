import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/helper/shared_stroge.dart';
import 'package:petetco/commons/utils/app_layout.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/auth/controllers/userinfo_provider.dart';
import 'package:petetco/features/bottom_bar.dart';
import 'package:petetco/features/onboarding/pages/onboarding_screen.dart';
import 'package:petetco/features/splash/widgets/picture_animation.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SharedStorage storage = SharedStorage();
    Future.delayed(const Duration(seconds: 3), () async {
      var token = await storage.getValue('token');

      if (token == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const OnBoardingScreen()));
        return;
      }

      var user = await ref.read(userInfoStateProvider.notifier).userInfo();

      if (user.data == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const OnBoardingScreen()));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => BottomBar()));
      }

      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (_) => const BottomBar()
      //   ));
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
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Styles.green900,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(300))),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: AppLayout.getScreenWidth(),
                  width: AppLayout.getScreenWidth(),
                  decoration: BoxDecoration(
                      color: Styles.grey500,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(400),
                      )),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          bottom: 0, // Start from the bottom
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/splash.png', // Example image
            fit: BoxFit.cover,
            height: 480, // Set height as needed
          ),
        ),
      ],
    ));

// return Scaffold(
//       body: Stack(
//         children: [
//           SizedBox(
//             width: 500,
//             child: Column(
//               children: [
//                 Container(
//                   width: 500,
//                   height: 530,
//                   decoration: BoxDecoration(
//                     color: Styles.green900,
//                     borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(150)),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Welcome",
//                           style: Styles.headLineStyle1
//                               .copyWith(color: Styles.grey100, fontSize: 50)),
//                       Gap(AppLayout.getHeight(10)),
//                       Text("to",
//                           style: Styles.headLineStyle1
//                               .copyWith(color: Styles.grey100, fontSize: 40)),
//                       Gap(AppLayout.getHeight(10)),
//                       Text("PETET CO",
//                           style: Styles.headLineStyle1
//                               .copyWith(color: Styles.grey100, fontSize: 60)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const PictureAnimation()
//         ],
//       ),
//     );
  }
}
