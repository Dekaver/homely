import 'package:flutter/material.dart';
import 'package:homely/Screens/Login/login_screen.dart';
import 'package:homely/Screens/Signup/signup_screen.dart';
import 'package:homely/Screens/Welcome/Components/background.dart';
import 'package:homely/components/rounded_button.dart';
import 'package:homely/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "WELCOME TO HOMELY",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.05),
          Image.asset(
            'assets/images/house.png',
            height: size.height * 0.45,
          ),
          SizedBox(height: size.height * 0.05),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            child: TextButton(
                key: Key('buttonKeyLogin'),
                child:
                    Text("login".toUpperCase(), style: TextStyle(fontSize: 14)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepPurple.shade200),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Colors.deepPurple.shade200)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                }),
          ),
          RoundedButton(
            text: "sign up",
            color: aPrimaryLightColor,
            textColor: Colors.deepPurple.shade200,
            rounded: 18.0,
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
    ));
  }
}
