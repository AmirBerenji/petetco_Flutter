import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/splash/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const ProviderScope(child: MyApp()));
  });
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final StreamSubscription<InternetStatus> _subscription;
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _subscription = InternetConnection().onStatusChange.listen((status) {
      setState(() {
        status == InternetStatus.connected;
      });
      if (status == InternetStatus.connected) {
        print('Connected to the internet');
      } else {
        print('No internet connection');
        scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            backgroundColor: Styles.errorRed,
            content: Text('No internet connection',style: Styles.headLineStyle2.copyWith(color: Styles.grey100),),
            duration: const Duration(seconds: 10),
          ),
        );
      }
    });
    _listener = AppLifecycleListener(
      onResume: _subscription.resume,
      onHide: _subscription.pause,
      onPause: _subscription.pause,
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _listener.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Petet Co',
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(primaryColor: primary),
      darkTheme: ThemeData.light(),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
