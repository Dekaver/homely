import 'package:flutter/material.dart';
import 'package:homely/Screens/About/about.dart';

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
                      image: AssetImage(
                          'assets/images/Foto-rumah-sederhana-tapi-elegan.jpg'))),
              child: Stack(children: <Widget>[
                Positioned(
                    bottom: 13.0,
                    left: 75.0,
                    child: Text("Homelyy",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500))),
              ])),
          Divider(),
          ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.info_outline_rounded),
                  Padding(
                      padding: EdgeInsets.only(left: 8.0), child: Text('About'))
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ));
              }),
        ],
      ),
    );
  }
}
