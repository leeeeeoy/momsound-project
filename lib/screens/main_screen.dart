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
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFFFFA9A9),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 16,
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
              icon: Icon(Icons.calendar_today),
            ),
            BottomNavigationBarItem(
              label: 'Storage',
              icon: Icon(Icons.storage),
            ),
            BottomNavigationBarItem(
              label: 'Menu',
              icon: Icon(Icons.settings),
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
