import 'package:flutter/material.dart';
import 'package:homely/Screens/Search/components/body.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.deepPurple.shade200,
        title: Text('Search'),
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
