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
      child: TextFormField(
        key:key,
        obscureText: true,
        onChanged: onChanged,
        controller: controller,
        validator: PasswordFieldValidator.validate,
        keyboardType: TextInputType.visiblePassword,
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

class PasswordFieldValidator {
  static String validate(String value) {
    var panjang = value.length;
    if (panjang < 8) {
      return 'Password must be 8 characters or more';
    }
    return value.isEmpty ? 'Password can\'t be Empty' : null;
  }
}
