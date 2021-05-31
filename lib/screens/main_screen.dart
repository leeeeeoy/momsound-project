import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momsori/models/user.dart';
import 'package:momsori/screens/diary_screen.dart';
import 'package:momsori/screens/home_screen.dart';
import 'package:momsori/screens/menu_screen.dart';
import 'package:momsori/screens/storage_screen.dart';

User user;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  var jsonData;

  @override
  void initState() {
    // todo 서버 실행 시 켤 것
    // jsonData = Get.arguments;
    // user = User.fromJson(jsonData);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
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
