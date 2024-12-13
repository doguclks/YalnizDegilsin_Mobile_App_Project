import 'package:app/colors/colors.dart';
import 'package:app/firebase_options.dart';
import 'package:app/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        scaffoldBackgroundColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: AppColors.textColor),
            hintStyle: TextStyle(color: Colors.grey)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
