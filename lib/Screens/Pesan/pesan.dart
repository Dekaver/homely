import 'package:flutter/material.dart';
import 'package:homely/Screens/Pesan/components/body.dart';

class PesanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.deepPurple.shade200,
        title: Text('Pesan'),
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
