import 'package:flutter/material.dart';

class WheelItemWidget extends StatelessWidget {
  final String ucValue;
  const WheelItemWidget({Key? key, required this.ucValue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 30),
            //   child: Text(
            //     ucValue,
            //     style: const TextStyle(color: Colors.black),
            //   ),
            // ),
            Image.asset('assets/images/6.png',width: (w * 0.85) / 8,)
            // Container(
            //   width: (w * 0.85) / 8,
            //   height: (w * 0.85) / 8,
            //   decoration: const BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage('assets/6.png'), fit: BoxFit.cover)),
            // ),
          ],
        ),
      ),
    );
  }
}
