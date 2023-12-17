import 'package:caninde_tur/pages/add.dart';
import 'package:caninde_tur/pages/favorite.dart';
import 'package:caninde_tur/pages/home.dart';
import 'package:caninde_tur/pages/login.dart';
import 'package:caninde_tur/pages/profile.dart';
import 'package:caninde_tur/pages/signUp.dart';
import 'package:caninde_tur/pages/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const SplashScreenPage(),
      routes: {
        'splashScreen': (context)=> const SplashScreenPage(),
        'login': (context)=> const LoginPage(),
        'signUp': (context)=> const SignUpPage(),
        'home': (context)=> const HomePage(),
        'add': (context)=> const AddPage(),
        'favorite': (context)=> const FavoritePage(),
        'profile': (context)=> const ProfilePage(),
      },
    );
  }
}
