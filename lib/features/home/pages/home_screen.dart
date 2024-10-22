import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petetco/commons/models/userinfo_model.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/auth/controllers/userinfo_provider.dart';
import 'package:petetco/features/onboarding/pages/onboarding_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with TickerProviderStateMixin {
  UserInfo? userInfo;
  bool isLoading = true; // Track if data is still being fetched

  @override
  void initState() {
    super.initState();
    _checkUserStatus(); // Check user info before showing the screen
  }

  Future<void> _checkUserStatus() async {
    // Fetch user info asynchronously
    final res = await ref.read(userInfoStateProvider.notifier).userInfo();
    
    // Update state when data is fetched
    setState(() {
      userInfo = res;
      isLoading = false;
    });

    // Navigate to OnBoardingScreen if user info is not available
    if (userInfo == null || userInfo?.data == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show a loading screen until data is fetched
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.grey400,
        title: Row(
          children: [
              Gap(10),
              Container(
                width: 40,
                height: 40,
                child: CircleAvatar(
                            radius: 50.0, // Adjust the size of the circle
                            backgroundImage: NetworkImage(userInfo!.data!.avatar.toString()),
                            
                          ),
              ),
              Gap(10),      
              Text(
                userInfo!.data!.name.toString(),
                style: Styles.headLineStyle2,
              ),
          ],
        ),
      ),
      backgroundColor: Styles.bgColor,
    );
  }
}
