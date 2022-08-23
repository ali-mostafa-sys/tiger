import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/wheel_item_widget.dart';

class WheelWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final selected;
  final List<int> items;
  const WheelWidget({Key? key, required this.selected, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        //////////// first wheel
        SizedBox(
          width: w < h ? w * 0.85 : h * 0.5,
          height: w < h ? w * 0.85 : h * 0.5,
          child: FortuneWheel(
            physics: NoPanPhysics(),
            indicators: const <FortuneIndicator>[],
            animateFirst: false,
            selected: selected.stream,
            onAnimationEnd: () {
              // setState(() {
              //   reward = items[selected.value];
              //   print(reward);
              //   isbutton = true;
              // });
            },
            items: [
              for (int i = 0; i < items.length; i++) ...<FortuneItem>{
                FortuneItem(
                  style: FortuneItemStyle(
                      color: HexColor('#F9D34B'),
                      borderColor: HexColor('#F9D34B')),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text(''), Text('')],
                  ),
                )
              }
            ],
          ),
        ),
        ///////////////////////// second wheel
        SizedBox(
          width: w < h ? (w * 0.85 - 30) : (h * 0.5 - 30),
          height: w < h ? (w * 0.85 - 30) : (h * 0.5 - 30),
          child: FortuneWheel(
            physics: NoPanPhysics(),
            indicators: const <FortuneIndicator>[],
            animateFirst: false,
            selected: selected.stream,
            onAnimationEnd: () {
              // setState(() {
              //   reward = items[selected.value];
              //   print(reward);
              //   isbutton = true;
              // });
            },
            items: [
              for (int i = 0; i < items.length; i++) ...<FortuneItem>{
                i % 2 == 0
                    ? FortuneItem(
                        style: FortuneItemStyle(
                            color: HexColor('#FFF1B4'),
                            borderColor: HexColor('#FFF1B4')),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RotatedBox(
                                    quarterTurns: 45,
                                    child: Center(
                                        child: Stack(
                                      children: [
                                        // The text border
                                        Text(
                                          '500',
                                          style: TextStyle(
                                            fontSize: 17,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 2.5
                                              ..color = Colors.black,
                                          ),
                                        ),
                                        // The text inside
                                        const Text(
                                          '500',
                                          style: TextStyle(
                                            fontSize: 17,
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )))
                              ],
                            ),
                          ),
                        ),
                      )
                    : FortuneItem(
                        style: FortuneItemStyle(
                            color: HexColor('#FD824C'),
                            borderColor: HexColor('#FD824C')),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RotatedBox(
                                  quarterTurns: 45,
                                  child: Center(
                                      child: Stack(
                                    children: [
                                      // The text border
                                      Text(
                                        '200',
                                        style: TextStyle(
                                          fontSize: 17,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 2.5
                                            ..color = Colors.black,
                                        ),
                                      ),
                                      // The text inside
                                      const Text(
                                        '200',
                                        style: TextStyle(
                                          fontSize: 17,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
              }
            ],
          ),
        ),
        ////////////////// third wheel
        SizedBox(
          width: w < h ? (w * 0.85 - 80) : (h * 0.5 - 80),
          height: w < h ? (w * 0.85 - 80) : (h * 0.5 - 80),
          child: FortuneWheel(
            physics: NoPanPhysics(),
            indicators: const <FortuneIndicator>[],
            animateFirst: false,
            selected: selected.stream,
            onAnimationEnd: () {
              // setState(() {
              //   reward = items[selected.value];
              //   print(reward);
              //   isbutton = true;
              // });
            },
            items: [
              for (int i = 0; i < items.length; i++) ...<FortuneItem>{
                i % 2 == 0
                    ? FortuneItem(
                        style: FortuneItemStyle(
                            color: HexColor('#E4D8A5'),
                            borderColor: HexColor('#E4D8A5')),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text(''), Text('')],
                        ),
                      )
                    : FortuneItem(
                        style: FortuneItemStyle(
                            color: HexColor('#D96639'),
                            borderColor: HexColor('#D96639')),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text(''), Text('')],
                        ),
                      )
              }
            ],
          ),
        ),
        // // /////////////////////// forth wheel
        SizedBox(
          width: w < h ? (w * 0.85 - 100) : (h * 0.5 - 100),
          height: w < h ? (w * 0.85 - 100) : (h * 0.5 - 100),
          child: FortuneWheel(
            physics: NoPanPhysics(),
            indicators: const <FortuneIndicator>[],
            animateFirst: false,
            selected: selected.stream,
            onAnimationEnd: () {
              // setState(() {
              //   reward = items[selected.value];
              //   print(reward);
              //   isbutton = true;
              // });
            },
            items: [
              for (int i = 0; i < items.length; i++) ...<FortuneItem>{
                i % 2 == 0
                    ? FortuneItem(
                        style: FortuneItemStyle(
                            color: HexColor('#C2B8C3'),
                            borderColor: HexColor('#C2B8C3')),
                        child: Stack(
                          children: [
                            WheelItemWidget(
                              ucValue: items[i].toString(),
                            ),
                          ],
                        ),
                      )
                    : FortuneItem(
                        style: FortuneItemStyle(
                            color: HexColor('#F1ECF2'),
                            borderColor: HexColor('#F1ECF2')),
                        child: WheelItemWidget(
                          ucValue: items[i].toString(),
                        ),
                      )
              }
            ],
          ),
        ),

        Container(
          width: (w * 0.85) / 3,
          height: (w * 0.85) / 3,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/indecator.png'))),
        ),
      ],
    );
  }
}
