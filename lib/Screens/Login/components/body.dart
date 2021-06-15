import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homely/Screens/Main/main.dart';
import 'package:homely/Screens/Login/components/background.dart';
import 'package:homely/Screens/Signup/signup_screen.dart';
import 'package:homely/components/already_have_an_account_acheck.dart';
import 'package:homely/components/rounded_button.dart';
import 'package:homely/components/rounded_email_field.dart';
import 'package:homely/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homely/components/text_field_container.dart';
import 'package:homely/constants.dart';
import 'package:homely/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    TextEditingController emailText = TextEditingController();
    TextEditingController passwordText = TextEditingController();
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              TextFieldContainer(
                child: TextFormField(
                  key: Key("signinEmailField"),
                  controller: emailText,
                  validator: EmailFieldValidator.validate,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: aPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: aPrimaryColor,
                    ),
                    hintText: "Your Email",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  key: Key('signinPasswordField'),
                  obscureText: true,
                  controller: passwordText,
                  validator: PasswordFieldValidator.validate,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: aPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock,
                      color: aPrimaryColor,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: aPrimaryColor,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: TextButton(
                  key: Key('loginButton'),
                  child: Text("login".toUpperCase(),
                      style: TextStyle(fontSize: 14)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.deepPurple.shade200),
                      // backgroundColor: background,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: aPrimaryColor)))),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _login(context, emailText.text, passwordText.text);
                    }
                  },
                ),
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
      ),
    );
  }

  void _login(BuildContext context, email, password) async {
    var data = {'email': email, 'password': password};

    var res = await Network().authData(data, '/api/login');
    var body = json.decode(res.body);
    if (body['status'] == "success") {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString(
          'token', json.encode(body['content']['access_token']));
      localStorage.setString('user', json.encode(body['content']['user']));
      Navigator.pushAndRemoveUntil(
          context,
          new MaterialPageRoute(builder: (context) => MainScreen()),
          (Route<dynamic> route) => false);
    } else if (body['msg'] == 'Validator error') {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text(body['errors'].toString()));
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text(body['msg']));
        },
      );
    }
  }
}
