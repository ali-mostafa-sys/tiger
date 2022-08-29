import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ShopWidget extends StatelessWidget {
  final String ucText;
  // ignore: prefer_typing_uninitialized_variables
  final onTap;
  const ShopWidget({Key? key, required this.ucText,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: HexColor('#094784'),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: HexColor('#5E5B4D'), width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AutoSizeText(
                  ucText,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 23,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2.5
                      ..color = HexColor('#B4B395'),
                  ),
                ),
                // The text inside
                AutoSizeText(
                  ucText,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 23,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#806644'),
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/uc2.png',
              width: 50,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
