import 'package:flutter/material.dart';
import 'package:tiger/core/app_theme.dart';

class BottomTextWidget extends StatelessWidget {
  String firstText;
  String secondText;
  var onTap;
   BottomTextWidget({Key? key,required this.firstText,required this.secondText,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style:const TextStyle(fontSize: 14),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            secondText,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: primaryColor),
          ),
        ),
      ],
    );
  }
}
