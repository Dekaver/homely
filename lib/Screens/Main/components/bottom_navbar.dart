import 'package:flutter/material.dart';
import 'package:homely/Screens/Main/main.dart';

class BottomNavbar extends StatelessWidget {
  final Color bgcolor;
  final press;

  const BottomNavbar({Key key, this.bgcolor, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      selectedFontSize: 15,
      backgroundColor: bgcolor,
      currentIndex: 0,
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
      onTap: press
      // (index) {
      //   setState(() {
      //     _currentIndex = index;
      //   });
      // },
    );
  }
}
