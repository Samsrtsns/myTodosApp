// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newtodoapp/view/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


//Firabase connection 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}


