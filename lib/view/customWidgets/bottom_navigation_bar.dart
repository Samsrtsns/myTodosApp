// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newtodoapp/provider/navbar_index.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    var navbarChangeIndex = Provider.of<NavbarChangeIndex>(context);

    return Container(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              navbarChangeIndex.changeIndex(0);
            },
            child: Container(
              child: Icon(
                Icons.favorite,
                size: 40,
                color: navbarChangeIndex.selectedIndex == 0
                    ? Colors.deepPurple
                    : Colors.grey,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              navbarChangeIndex.changeIndex(1);
            },
            child: Container(
              child: Icon(
                Icons.home,
                size: 40,
                color: navbarChangeIndex.selectedIndex == 1
                    ? Colors.deepPurple
                    : Colors.grey,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              navbarChangeIndex.changeIndex(2);
            },
            child: Container(
              child: Icon(
                Icons.person,
                size: 40,
                color: navbarChangeIndex.selectedIndex == 2
                    ? Colors.deepPurple
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
