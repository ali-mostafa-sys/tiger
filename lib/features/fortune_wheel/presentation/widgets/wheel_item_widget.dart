import 'package:flutter/material.dart';

class WheelItemWidget extends StatelessWidget {
  final String ucValue;
  const WheelItemWidget({Key? key, required this.ucValue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            ucValue,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/6.png'), fit: BoxFit.cover)),
        ),
      ],
    );
  }
}
