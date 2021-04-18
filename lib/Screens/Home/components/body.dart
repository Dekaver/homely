import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homely/Screens/Login/components/background.dart';
import 'package:homely/Screens/Login/login_screen.dart';
import 'package:homely/components/rounded_button.dart';
import 'package:homely/constants.dart';
import 'package:homely/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Text(
              "Welcome To Home Screen",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RoundedButton(
              text: "login",
              color: aPrimaryColor,
              rounded: 18.0,
              textColor: Colors.deepPurple.shade200,
              press: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
  void logout(BuildContext context) async{
    var res = await Network().getData('/api/logout');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
  }
}
