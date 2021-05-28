import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homely/Screens/Login/login_screen.dart';
import 'package:homely/Screens/Signup/components/background.dart';
import 'package:homely/Screens/Signup/components/or_divider.dart';
import 'package:homely/Screens/Signup/components/social_icon.dart';
import 'package:homely/components/already_have_an_account_acheck.dart';
import 'package:homely/components/rounded_button.dart';
import 'package:homely/components/rounded_email_field.dart';
import 'package:homely/components/rounded_input_field.dart';
import 'package:homely/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homely/constants.dart';
import 'package:homely/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameText = TextEditingController();
    TextEditingController emailText = TextEditingController();
    TextEditingController passwordText = TextEditingController();
    TextEditingController password2Text = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "name",
              controller: nameText,
              onChanged: (value) {},
            ),
            RoundedEmailField(
              hintText: "Your Email",
              controller: emailText,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",
              controller: passwordText,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Confirm Password",
              controller: password2Text,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              color: aPrimaryColor,
              rounded: 18.0,
              textColor: Colors.deepPurple.shade200,
              press: () {
                _register(context, nameText.text, emailText.text, passwordText.text);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  void _register(BuildContext context, name, email, password)async{
    
    var data = {
      'name': name,
      'email' : email,
      'password': password,
    };

    var res = await Network().authData(data, '/api/signup');
    var body = json.decode(res.body);
    if(body['status'] == 'success'){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['access_token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => LoginScreen()
        ),
      );
    } else if(body['msg'] == 'Validator error'){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(body['content']['email'] == null ? body['content']['password']['0'] : body['content']['email']['0'])
          );
        },
      );
    }else{
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(body['content'] == null ? '' : body['content'])
          );
        },
      );
    }
  }
}
