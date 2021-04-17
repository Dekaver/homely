import 'package:flutter/material.dart';
import 'package:homely/components/text_field_container.dart';
import 'package:homely/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
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
    );
  }
}
