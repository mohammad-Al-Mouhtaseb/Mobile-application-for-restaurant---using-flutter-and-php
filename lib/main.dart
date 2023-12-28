import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:haven/view/login_screen.dart';
import 'package:haven/view/signin_screen.dart';
import 'package:haven/view/profile_screen.dart';
import 'package:haven/view/customer/home_screen.dart';
import 'package:haven/view/customer/showFood_screen.dart';
import 'package:haven/view/customer/favorite_screen.dart';
import 'view/splash_screen.dart';
import 'view/customer/searsh_screen.dart';

late String session_email;
late String session_fname;
late String session_lname;
late Uint8List session_photo;

final String ip = "192.168.1.104";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splash_screen.id,
      routes: {
        Splash_screen.id: (context) => const Splash_screen(),
        LoginScreen.id: (context) => LoginScreen(),
        home_screen.id: (context) => home_screen(),
        SigninScreen.id: (context) => SigninScreen(),
        Menu.id: (context) => Menu(),
        FavoriteScreen.id: (context) => FavoriteScreen(),
        profile_screen.id: (context) => profile_screen(),
        searsh_screen.id: (context) => searsh_screen(),
      },
    );
  }
}
