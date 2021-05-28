import 'package:flutter/material.dart';
import 'package:homely/Screens/Home/home.dart';
import 'package:homely/Screens/Map/map.dart';
import 'package:homely/Screens/Pesan/pesan.dart';
import 'package:homely/Screens/Profile/profile.dart';
import 'package:homely/Screens/Search/search.dart';

import 'components/bottom_navbar.dart';
import 'components/sidebar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final tabs = [
    Container(child: HomeScreen()),
    Container(child: SearchScreen()),
    Container(child: MapScreen()),
    Container(child: PesanScreen()),
    Container(child: ProfileScreen()),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text('Homely'),
      ),
      
      drawer: Sidebar(),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavbar(
        bgcolor: Colors.purple.shade900,
        index: _currentIndex,
        press: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ), 
    );
  }
}
