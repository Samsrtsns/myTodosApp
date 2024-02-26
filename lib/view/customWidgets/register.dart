// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:newtodoapp/provider/sign_in_change.dart';
import 'package:newtodoapp/viewModel/login/auth_functions.dart';
import 'package:newtodoapp/viewModel/loginScreenFunctions/login_screen_functions.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatefulWidget {
  RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final emailControllerRegister = TextEditingController();

  final passwordControllerRegister = TextEditingController();

  final confirmPasswordControllerRegister = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var changeText = Provider.of<ChangeToSignUp>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
          child: LoginScreenFunctions.inputContainer(
              "Email", emailControllerRegister),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: LoginScreenFunctions.inputContainer(
              "Password", passwordControllerRegister,
              isTrue: true),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
          child: LoginScreenFunctions.inputContainer(
              "Password again", confirmPasswordControllerRegister,
              isTrue: true),
        ),
        GestureDetector(
          onTap: () {
            if (passwordControllerRegister.text ==
                confirmPasswordControllerRegister.text) {
              SignUpService.signUp(
                emailControllerRegister.text,
                passwordControllerRegister.text,
              );
              emailControllerRegister.clear();
              passwordControllerRegister.clear();
              confirmPasswordControllerRegister.clear();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Kayıt olundu"),
                  duration: Duration(seconds: 2),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Passwords do not match."),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: Padding(
            padding:
                const EdgeInsets.only(right: 30, left: 30, bottom: 40, top: 20),
            child: LoginScreenFunctions.loginContainer("Sign Up"),
          ),
        ),
        ElevatedButton(
          onPressed: () => changeText.changeToScreen(),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
            backgroundColor: const Color.fromARGB(255, 98, 23, 228),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), // Border radius
            ),
          ),
          child: const Text(
            "Back",
            style: TextStyle(
              color: Colors.white, // Metin rengi
              fontSize: 16.0, // Metin font büyüklüğü
            ),
          ),
        ),
      ],
    );
  }
}
