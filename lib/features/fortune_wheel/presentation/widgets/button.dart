import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double h1;
  final double h2;
  final String hexaColor1;
  final String hexaColor2;
  final double textSize;
  // ignore: prefer_typing_uninitialized_variables
  final tap;

  const CustomButton({
    Key? key,
    required this.text,
    required this.h1,
    required this.h2,
    required this.tap,
    required this.hexaColor1,
    required this.hexaColor2,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: SizedBox(
        height: h1,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                width: double.infinity,
                height: h1,
                decoration: BoxDecoration(
                  color: HexColor(hexaColor2),
                  //#5A4D68
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22)),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: h2,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    spreadRadius: 0,
                    blurRadius: 0.0,
                  ),
                  BoxShadow(
                    color: HexColor(hexaColor1),
                    // #6B5A7E
                    spreadRadius: -3.0,
                    blurRadius: 10.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: AutoSizeText(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: textSize),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
