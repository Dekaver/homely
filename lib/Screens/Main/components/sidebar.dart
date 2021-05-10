import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
      );
  }
}
