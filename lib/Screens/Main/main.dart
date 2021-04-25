import 'package:flutter/material.dart';
import 'package:homely/Screens/Home/home.dart';
import 'package:homely/Screens/Map/map.dart';
import 'package:homely/Screens/Pesan/pesan.dart';
import 'package:homely/Screens/Profile/profile.dart';
import 'package:homely/Screens/Search/search.dart';

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
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 15,
        backgroundColor: Colors.deepPurple.shade200,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            backgroundColor: Colors.deepPurple,
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'MAP',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'PESAN',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PROFILE',
            backgroundColor: Colors.deepPurple,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
