import 'package:flutter/material.dart';

class GoogleButtonWidget extends StatelessWidget {
  var onTap;

  GoogleButtonWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_google.png'))),
      ),
    );
  }
}
