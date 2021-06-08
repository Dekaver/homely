import 'package:flutter/material.dart';
import 'package:homely/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final MaterialStateProperty background;
  final double rounded;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = aPrimaryColor,
    this.textColor = Colors.white,
    this.background,
    this.rounded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: TextButton(
        key:key,
        child: Text(text.toUpperCase(), style: TextStyle(fontSize: 14)),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(textColor),
            backgroundColor: background,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(rounded),
                    side: BorderSide(color: color)))),
        onPressed: press,
      ),
    );
  }
}
