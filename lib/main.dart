import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/splash/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitUp,

  ]).then((_){
    runApp(const MyApp());
  }

  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Petet Co',
      theme: ThemeData.light(
        useMaterial3: true,      
      ).copyWith(primaryColor:primary),
      darkTheme: ThemeData.light(),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
