import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/feed.dart';
import '../screens/home.dart';
import '../screens/profile.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HelpMeOut',
      home: Display(),
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  int selectedIndex = 0;

  final screenOptions = [
    const Home_Page(),
    const Feed_Page(),
    const Profile_Page(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        elevation: 5,
        iconSize: 30,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Feed',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.pink,
          )
        ],
      ),
    );
  }
}
