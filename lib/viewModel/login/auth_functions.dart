// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newtodoapp/view/menu/home_screen.dart';

//Bu hata aldığımızda bize error çıkartır
class PopUpFunction {
  Future<void> popUp(BuildContext context, String text) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Uyarı"),
          content: Text(text),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tamam"),
            ),
          ],
        );
      },
    );
  }
}

//Email ve Password kontrolü yaparak giriş yapar
class SignInService {
  static Future<void> signIn(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    final PopUpFunction popUpFunction = PopUpFunction();
    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (password.isEmpty && email.isNotEmpty) {
        popUpFunction.popUp(context, "Lütfen Bir Şifre giriniz");
        return;
      }
      if (email.isEmpty && password.isNotEmpty) {
        popUpFunction.popUp(context, "Lütfen Bir Email giriniz");
        return;
      }
      if (password.isEmpty && email.isEmpty) {
        popUpFunction.popUp(context, "Lütfen Şifre ve Email giriniz");
        return;
      }

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ),
        );
      }
    } catch (e) {
      popUpFunction.popUp(context, "Şifre ya da email Yanlış.");
    }
  }
}

class SignUpService {
  static Future<void> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      print("User created: ${user?.uid}");
    } catch (e) {
      // Hata durumunda buraya gelecek
      print("Error creating user: $e");
    }
  }
}
