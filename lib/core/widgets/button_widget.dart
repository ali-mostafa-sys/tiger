import 'package:flutter/material.dart';
import 'package:tiger/core/app_theme.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  var onTap;

  ButtonWidget({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: primaryColor,
      minWidth: double.infinity,
      height: 56,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
