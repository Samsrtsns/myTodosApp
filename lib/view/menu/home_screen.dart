// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppBar(
            scrolledUnderElevation: 0,
            title: Text('MY TODOS'),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            left: 10,
            right: 10,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  15,
                  (index) => Container(
                    height: 100, // Set the height as needed
                    margin: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.blueAccent, // Change color as needed
                    child: Center(
                      child: Text('Container $index'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            bottom: 50,
            height: 50,
            child: CustomNavBar(),
          ),
        ],
      ),
    );
  }
}

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            child: Icon(Icons.favorite),
          ),
          CircleAvatar(
            child: Icon(Icons.home),
          ),
          CircleAvatar(
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
