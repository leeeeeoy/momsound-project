import 'package:flutter/material.dart';
import 'package:momsori/screens/diary_screen.dart';
import 'package:momsori/screens/home_screen.dart';
import 'package:momsori/screens/menu_screen.dart';
import 'package:momsori/screens/storage_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Diary',
              icon: Icon(Icons.menu_book_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Storage',
              icon: Icon(Icons.storage),
            ),
            BottomNavigationBarItem(
              label: 'Menu',
              icon: Icon(Icons.account_circle_rounded),
            ),
          ],
        ),
      ),
    );
  }

  List _widgetOptions = [
    HomeScreen(),
    DiaryScreen(),
    StorageScreen(),
    MenuScreen(),
  ];
}
