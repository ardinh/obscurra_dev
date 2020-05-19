import 'package:flutter/material.dart';
import 'package:obscura/favoritePage.dart';
import 'package:obscura/homePage.dart';
import 'package:obscura/notificationPage.dart';
import 'package:obscura/profilePage.dart';

class MDIPage extends StatefulWidget {
  @override
  _MDIPageState createState() => _MDIPageState();
}

class _MDIPageState extends State<MDIPage> {
  int _selectedIndex = 0;
  final _indexOptions = [
    HomePage(),
    FavoritePage(),
    NotificationPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _indexOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey[600],
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.grey[600]),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey[600],
              ),
              title: Text(
                'Favorite',
                style: TextStyle(color: Colors.grey[600]),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: Colors.grey[600],
              ),
              title: Text(
                'Notification',
                style: TextStyle(color: Colors.grey[600]),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.grey[600],
              ),
              title: Text(
                'Profil',
                style: TextStyle(color: Colors.grey[600]),
              )),
        ],
      ),
    );
  }
}
