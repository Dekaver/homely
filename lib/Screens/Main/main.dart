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
      appBar: AppBar(
        title: Text('Homely'),
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image:  AssetImage('assets/images/bubbles_pink.png'))),
              child: Stack(
                children: <Widget>[
                Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Text("Homely",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                    )
                  )
                ),
              ])
            ),
            ListTile(
              // leading: Icon(Icons.alarm),
              title: Row(
                children: <Widget>[
                  Icon(Icons.alarm),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Alarm')
                  )
                ],
              ),
              onTap: () {
                print("Change page");
                Navigator.pop(context);
              },
            ),
             ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("AC"),
              onTap: () {
                // Change the applications state
                print("Change page");
                Navigator.pop(context);
              },
            ),
            Divider(),
             ListTile(
              leading: Icon(Icons.directions_bike),
              title: Text("Bike"),
              onTap: () {
                // Change the applications state
                print("SIlahkan Pindah Halaman");
                Navigator.pop(context);
              },
            ),
             ListTile(
              leading: Icon(Icons.chrome_reader_mode),
              title: Text("Read"),
              onTap: () {
                // Change the applications state
                print("Silahkan Pindah Halaman");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
