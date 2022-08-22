import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RightBarWidget extends StatelessWidget {
  final String img;
  final String text;
  final double textSize;
  final tap;

  const RightBarWidget({
    Key? key,
    required this.img,
    required this.text,
    required this.textSize,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: tap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: HexColor('#BEEDFF'),
                ),
                shape: BoxShape.circle,
                color: HexColor('#09569C'),
                image: DecorationImage(
                    image: AssetImage(img), fit: BoxFit.contain)),
          ),
          ////////////////////////
          Container(
            // color: Colors.red,
            width: (w / 4)-20,
            height:(h / 4) - 120 ,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // The text border
                AutoSizeText(
                  text,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: textSize,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2.5
                      ..color = HexColor('#09569C'),
                  ),
                ),
                // The text inside
                AutoSizeText(
                  text,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: textSize,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
