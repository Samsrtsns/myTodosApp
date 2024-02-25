import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LoginScreenFunctions {
  
  //Image Position
static Widget customPositioned(
  String assetName, {
  double? top,
  double? bottom,
  double? right,
  double? left,
  double? width,
  double? height,
}) {
  return Positioned(
    left: left,
    top: top,
    right: right,
    bottom: bottom,
    width: width,
    height: height,
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetName),
        ),
      ),
    ),
  );
}


//Input Container
static Widget inputContainer(String text,{bool ? isTrue = false}) {
  return FadeInDown(
    duration: const Duration(seconds: 1),
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Gölge rengi ve şeffaflığı
            spreadRadius: 3, // Gölge genişliği
            blurRadius: 6, // Gölge bulanıklığı
            offset: const Offset(0, 4), // Gölge konumu (x, y)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: TextField(
          obscureText: isTrue ?? false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    ),
  );
}

//Login Container
static Widget loginContainer() {
  return FadeInUp(
    duration: const Duration(seconds: 1),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6), // Gölge rengi ve şeffaflığı
            spreadRadius: 3, // Gölge genişliği
            blurRadius: 6, // Gölge bulanıklığı
            offset: const Offset(0, 0), // Gölge konumu (x, y)
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 98, 23, 228),
      ),
      child: const Center(
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: -1),
        ),
      ),
    ),
  );
}

static Widget loginAccount(String iconsPage) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3), // Gölge rengi ve şeffaflığı
          spreadRadius: 3, // Gölge genişliği
          blurRadius: 6, // Gölge bulanıklığı
          offset: const Offset(0, 4), // Gölge konumu (x, y)
        ),
      ],
    ),
    child: Image.asset(
      iconsPage,
      width: 45, 
      height: 45, 
    ),
  );
}
}