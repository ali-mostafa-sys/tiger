import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/rightbarwidget.dart';

class RightBar extends StatelessWidget {
  const RightBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: (w / 4),
          height: (h / 4) - 22,
          decoration: BoxDecoration(
            color: HexColor('#ADECFF'),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
          ),
        ),
        Container(
          width: (w / 4) - 4,
          height: (h / 4) - 30,
          decoration: BoxDecoration(
            color: HexColor('#62C2FE'),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(22),
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: RightBarWidget(
                  img: 'assets/images/shop_icon.png',
                  text: 'SHOP',
                  textSize: 15,
                  tap: () {},
                )),
                /////
                SizedBox(
                  height: h * 0.01,
                ),
                /////
                Expanded(
                    child: RightBarWidget(
                  img: 'assets/images/upgrade_icon.png',
                  text: 'UPGRADE',
                  textSize: 13,
                  tap: () {},
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
