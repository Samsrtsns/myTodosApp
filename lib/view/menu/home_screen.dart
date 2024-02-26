// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:newtodoapp/provider/navbar_index.dart';
import 'package:newtodoapp/view/customWidgets/bottom_navigation_bar.dart';
import 'package:newtodoapp/viewModel/loginScreenFunctions/login_screen_functions.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var navbarChangeIndex = Provider.of<NavbarChangeIndex>(context);

    TextEditingController firstText = TextEditingController();
    TextEditingController secondText = TextEditingController();


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppBar(
            scrolledUnderElevation: 0,
            title: navbarChangeIndex.selectedIndex == 0
                ? Text("FAVORITE")
                : navbarChangeIndex.selectedIndex == 1
                    ? Text("MY TODOS")
                    : Text("PROFILE"),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.add,
                  size: 35,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Create a todo",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -1),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: LoginScreenFunctions.inputContainer(
                                "Başlık ", firstText),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: LoginScreenFunctions.inputContainer(
                                "Alt Başlık ", secondText),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {

                            },
                            child: Text('Ekle'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          navbarChangeIndex.selectedIndex == 1
              ? Positioned.fill(
                  left: 10,
                  right: 10,
                  child: SingleChildScrollView(
                    child: Column(
                      children:
                          List.generate(2, (index) => todosContainer(index)),
                    ),
                  ),
                )
              : navbarChangeIndex.selectedIndex == 0
                  ? Center(
                      child: Text("Favorite page"),
                    )
                  : Center(
                      child: Text("Profile page"),
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

Widget todosContainer(int index) {
  return Container(
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.deepPurple[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Yazılar
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bugün bu yapılacak",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: -1,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Eklenti yazı",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 247, 247),
                    fontSize: 14,
                    letterSpacing: -1,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
          //Tarih
          Text(
            "12/04/2001",
            style: TextStyle(color: Colors.white),
          ),
          //CheckBox ve Silme İconu
          // Checkbox(value: false, onChanged: null),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.delete_forever,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ));
}
