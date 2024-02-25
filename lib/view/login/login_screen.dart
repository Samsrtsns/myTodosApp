// ignore_for_file: prefer_const_constructors;, prefer_const_constructors
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:newtodoapp/viewModel/login/auth_functions.dart';
import 'package:newtodoapp/viewModel/loginScreenFunctions/login_screen_functions.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              FadeIn(
                duration: Duration(milliseconds: 2000),
                child: Container(
                  height: screenHeight / 2.1,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Stack(
                    children: <Widget>[
                      LoginScreenFunctions.customPositioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          'assets/images/light-1.png'),
                      LoginScreenFunctions.customPositioned(
                          left: 160,
                          width: 80,
                          height: 160,
                          'assets/images/light-2.png'),
                      LoginScreenFunctions.customPositioned(
                          top: 10,
                          right: 40,
                          width: 80,
                          height: 200,
                          'assets/images/clock.png'),
                      const Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 15),
                child: LoginScreenFunctions.inputContainer(
                    "Email", emailController),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: LoginScreenFunctions.inputContainer(
                    "Password", passwordController,
                    isTrue: true),
              ),
              GestureDetector(
                onTap: () {
                  SignInService.signIn(context, emailController, passwordController);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: LoginScreenFunctions.loginContainer(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Or",
                  style: TextStyle(
                    color: Color.fromARGB(255, 93, 62, 147),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoginScreenFunctions.loginAccount(
                    'assets/icons/apple.png',
                    width: 50,
                    height: 50,
                  ),
                  LoginScreenFunctions.loginAccount(
                      'assets/icons/facebook.png'),
                  LoginScreenFunctions.loginAccount(
                    'assets/icons/google.png',
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 93, 62, 147),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
