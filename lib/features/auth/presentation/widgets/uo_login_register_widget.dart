import 'package:flutter/material.dart';

class UpLoginRegisterWidget extends StatelessWidget {
  String text;

  UpLoginRegisterWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
         Image(
          image: AssetImage('assets/images/login_upp.png'),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 49.35,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),
        ),
      ],
    );
  }
}
