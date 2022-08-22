import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TotalPrizeWidget extends StatelessWidget {
  const TotalPrizeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 75,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 5,
              color: HexColor('#7F84AE'),
            ),
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/4.png'), fit: BoxFit.cover)),
            ),
            const Text(
              '200',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
