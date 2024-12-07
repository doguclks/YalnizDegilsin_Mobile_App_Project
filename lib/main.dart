import 'package:app/colors/colors.dart';
import 'package:app/pages/how_to_use_screen.dart';
import 'package:app/pages/login.dart';
import 'package:app/pages/splash_screen_1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.f
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yalnız Değilsin!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.black,
            iconTheme: IconThemeData(color: AppColors.textColor)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
