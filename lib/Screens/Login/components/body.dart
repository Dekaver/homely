import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homely/Screens/Home/home.dart';
import 'package:homely/Screens/Login/components/background.dart';
import 'package:homely/Screens/Signup/signup_screen.dart';
import 'package:homely/components/already_have_an_account_acheck.dart';
import 'package:homely/components/rounded_button.dart';
import 'package:homely/components/rounded_input_field.dart';
import 'package:homely/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homely/constants.dart';
import 'package:homely/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController emailText = TextEditingController();
    TextEditingController passwordText = TextEditingController();
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              controller: emailText,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",
              controller: passwordText,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "login",
              color: aPrimaryColor,
              rounded: 18.0,
              textColor: Colors.deepPurple.shade200,
              press: () {
                _login(context, emailText.text, passwordText.text);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context, email, password) async {
    var data = {'email': email, 'password': password};

    var res = await Network().authData(data, '/api/login');
    var body = json.decode(res.body);
    if (body['status'] == "success") {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['content']['access_token']));
      localStorage.setString('user', json.encode(body['content']['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(body['msg'])
          );
        },
      );
    }
  }
}
