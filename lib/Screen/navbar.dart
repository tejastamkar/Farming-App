// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kisaanhal/Screen/chatscreen.dart';
import 'package:kisaanhal/Screen/homescreen.dart';
import 'package:kisaanhal/Screen/profilescreen.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  String appBarTitle = 'Kisaan Hal';
  final screens = [HomePage(), ChatScreen(), ProfileScreen()];

  // ignore: non_constant_identifier_names
  ChangeAppBarTitle({required int inDexNumber}) {
    switch (inDexNumber) {
      case 0:
        appBarTitle = 'Kisaan Hal';
        break;
      case 1:
        appBarTitle = 'Chat';
        break;
      case 2:
        appBarTitle = 'Profile';
        break;
      default:
        appBarTitle = 'Kisaan Hal';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(appBarTitle),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   titleTextStyle: TextStyle(color: Colors.black, fontSize: 26.0),
      //   centerTitle: true,
      // ),
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('icons/Notselected_Home.png')),
            activeIcon: Image.asset('icons/Home.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('icons/Notselected_Message.png')),
            activeIcon: Image.asset('icons/Message.png'),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('icons/Notselected_Profile.png')),
            activeIcon: Image.asset('icons/Profile.png'),
            label: 'Profile',
          ),
        ],
        selectedFontSize: 20,
        unselectedFontSize: 20,
        selectedLabelStyle: TextStyle(fontSize: 0),
        unselectedLabelStyle: TextStyle(fontSize: 0),
        currentIndex: _selectedIndex,
        onTap: (index) => {
          setState(() {
            _selectedIndex = index;
          }),
          ChangeAppBarTitle(inDexNumber: _selectedIndex)
        },
      ),
    );
  }
}
