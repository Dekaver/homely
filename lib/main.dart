import 'package:flutter/material.dart';
import 'package:homely/Screens/Main/main.dart';
import 'package:homely/Screens/Welcome/welcome.dart';
import 'package:homely/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homely',
      theme: ThemeData(
        primaryColor: aPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CheckAuth(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      setState(() {
        isAuth = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = MainScreen();
    } else {
      child = WelcomeScreen();
    }
    return Scaffold(
      body: child,
    );
  }
}
