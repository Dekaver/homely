import 'package:flutter/material.dart';
import 'package:homely/Screens/Map/components/body.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.deepPurple.shade200,
        title: Text('Map'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Body(),
    );
  }
}
