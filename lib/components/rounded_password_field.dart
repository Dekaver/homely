import 'package:flutter/material.dart';
import 'package:homely/components/text_field_container.dart';
import 'package:homely/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        controller: controller,
        cursorColor: aPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
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
