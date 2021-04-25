import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homely/Screens/Welcome/welcome.dart';
import 'package:homely/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 56,
          backgroundImage: NetworkImage(
              'https://www.freeiconspng.com/uploads/female-user-icon-clip-art--30.png'),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Alwi Wahyudi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.person),
            Text('Alwi Wahyudi'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.phone),
            Text('0812-5013-7084'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.exit_to_app),
            TextButton(
              onPressed: () {
                _logout(context);
              },
              child: Text('Log Out')
            ),
          ],
        ),
      ],
    );
  }

  void _logout(BuildContext context) async {
    var res = await Network().getData('/api/logout');
    var body = json.decode(res.body);
    // if (body['success']) {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    // }
  }
}
