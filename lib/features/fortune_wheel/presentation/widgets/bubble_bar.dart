import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BubbleBar extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final firstTap;
  // ignore: prefer_typing_uninitialized_variables
  final secondTap;
  const BubbleBar({Key? key, required this.firstTap, required this.secondTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: (w / 4),
      height: (h / 4) - 13,
      child: Column(
        children: [
          /////
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: firstTap,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bubble1.png'),
                        fit: BoxFit.contain)),
              ),
            ),
          ),
          ////

          Expanded(
            flex: 1,
            child: Container(
              width: (w / 4) - 20,
              // height: (h / 4) / 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: HexColor('#919093'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  BoxShadow(
                    color: Colors.grey.shade100.withOpacity(0.3),
                    spreadRadius: -1.0,
                    blurRadius: 6.0,
                  ),
                ],
                // color:
              ),
              child: Center(
                  child: Stack(
                children: [
                  // The text border
                  AutoSizeText(
                    'Invite',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2.5
                        ..color = HexColor('#827A39'),
                      //#827A39
                    ),
                  ),
                  // The text inside
                  AutoSizeText(
                    'Invite',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      
                      color: HexColor('#F7F670'),
                    ),
                  ),
                ],
              )),
            ),
          ),
          //////
          SizedBox(
            height: h * 0.011,
          ),
          //////
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: secondTap,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/bubble2.png',
                        ),
                        fit: BoxFit.contain)),
              ),
            ),
          ),
          /////////
          Expanded(
            flex: 1,
            child: Container(
              width: (w / 4) - 20,
              // height: (h / 4) / 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: HexColor('#919093'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  BoxShadow(
                    color: Colors.grey.shade100.withOpacity(0.3),
                    spreadRadius: -1.0,
                    blurRadius: 6.0,
                  ),
                ],
                // color:
              ),
              child: Center(
                  child: Stack(
                children: [
                  // The text border
                  AutoSizeText(
                    'Rate',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2.5
                        ..color = HexColor('#827A39'),
                      //#827A39
                    ),
                  ),
                  // The text inside
                  AutoSizeText(
                    'Rate',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#F7F670'),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
