import 'package:flutter/material.dart';
import 'package:homely/Screens/About/components/body.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About'),),
      body: Body(),
    );
    
  }
}
