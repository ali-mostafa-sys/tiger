import 'package:flutter/material.dart';

import 'package:tiger/core/app_theme.dart';

class TextFormWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String labelText;
  bool obscureText;
  TextInputType textInputType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  var validator;
  var onTap;

  TextFormWidget(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.textInputType,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      required this.validator,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      style: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: primaryColor,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      onTap: onTap,
    );
  }
}
