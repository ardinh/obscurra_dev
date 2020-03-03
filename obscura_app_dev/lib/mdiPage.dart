import 'package:flutter/material.dart';
import 'package:obscura/dashboardPage.dart';
import 'package:obscura/loginPage.dart';
import 'package:obscura/profilPage.dart';

class MDIPage extends StatefulWidget {
  @override
  _MDIPageState createState() => _MDIPageState();
}

class _MDIPageState extends State<MDIPage> {
  int _selectedIndex = 0;
  final _indexOptions = [DashboardPage(), LoginPage(), ProfilePage()];

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
                Icons.dashboard,
                color: Colors.grey[600],
              ),
              title: Text(
                'Dashboard',
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
                Icons.person,
                color: Colors.grey[600],
              ),
              title: Text(
                'Profil',
                style: TextStyle(color: Colors.grey[600]),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.grey[600],
              ),
              title: Text(
                'Attendance',
                style: TextStyle(color: Colors.grey[600]),
              )),
        ],
      ),
    );
  }
}
