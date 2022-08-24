import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FirstContainerWidget extends StatelessWidget {
  final double width;
  final String text;
  final double fontSize;
  const FirstContainerWidget(
      {Key? key,
      required this.width,
      required this.text,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 3,
          color: HexColor('#BEEDFF'),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
          ),
          BoxShadow(
            color: HexColor('#0B559E'),
            spreadRadius: -3.0,
            blurRadius: 5.0,
          ),
        ],
        // color:
      ),
      child: Center(
        child: AutoSizeText(
          text,
          maxLines: 2,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              
             ),
        ),
      ),
    );
  }
}
