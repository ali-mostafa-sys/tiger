import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/bubble_bar.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/button.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/first_container.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/right_bar.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/wheel_widget.dart';

class WheelPage extends StatefulWidget {
  const WheelPage({Key? key}) : super(key: key);

  @override
  State<WheelPage> createState() => _WheelPageState();
}

class _WheelPageState extends State<WheelPage> {
  final selected = BehaviorSubject<int>();

  List<int> items = [100, 1000, 500, 200, 300, 350, 50, 80, 50, 60];

  int reward = 0;

  bool isbutton = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();

    selected.close();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        //////
        body: Stack(
          alignment: Alignment.center,
          children: [
            //// background
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/home_page.png'),
                      fit: BoxFit.cover)),
            ),
            ////// opacity container
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
            /////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///////1
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //1
                          SizedBox(
                            width: w / 3,
                            height: 65,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: FirstContainerWidget(
                                    width: w / 4,
                                    text: '200',
                                    fontSize: 15,
                                  ),
                                ),
                                Positioned(
                                  bottom: 4,
                                  child: Image.asset(
                                    'assets/images/4.png',
                                    width: 68,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //2
                          FirstContainerWidget(
                            width: w / 4.3,
                            text: 'LogOut',
                            fontSize: 15,
                          ),
                          //3
                          SizedBox(
                            width: w / 3.2,
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                FirstContainerWidget(
                                  width: w / 4.1,
                                  text: 'Ali Mostafa',
                                  fontSize: 10,
                                ),
                                //////////////////
                                Positioned(
                                  left: 0,
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 3,
                                          color: HexColor('#BEEDFF'),
                                        ),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade900,
                                          ),
                                          BoxShadow(
                                            color: HexColor('#0B559E'),
                                            spreadRadius: -1.0,
                                            blurRadius: 20.0,
                                          ),
                                        ],
                                        image: const DecorationImage(
                                          image:
                                              AssetImage('assets/images/8.png'),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: h * 0.02,
                  ),

                  /// 2
                  Expanded(
                    child: Stack(
                      children: [
                        //right bar
                        const Align(
                          alignment: Alignment.topRight,
                          child: RightBar(),
                        ),
                        ////////////// home
                        Positioned(
                          top: (h / 2 - 75) - (h * 0.02) - w * 0.85 / 1.6,
                          left: w < h
                              ? w / 2 - ((w * 0.85 / 4))
                              : w / 2 - ((h * 0.5 / 4)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/7.png',
                                fit: BoxFit.cover,
                                width: w < h ? w * 0.85 / 2 : h * 0.5 / 2,
                              ),
                              Positioned(
                                  left: w < h
                                      ? w / 2 - ((w * 0.85 / 3.1))
                                      : w / 2 - ((h * 0.5 / 3.1)),
                                  child: const AutoSizeText(
                                    '20',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        ///////// wheel
                        Align(
                          alignment: Alignment.center,
                          child: WheelWidget(
                            items: items,
                            selected: selected,
                          ),
                        ),

                        ////// bubble bar

                        Padding(
                          padding: EdgeInsets.only(bottom: h * 0.045),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: BubbleBar(
                                firstTap: () {
                                  print('1');
                                },
                                secondTap: () {
                                  print('2');
                                },
                              )),
                        ),

                        //////////////////// button
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.26,
                              right: w * 0.26,
                              bottom: h * 0.005),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: CustomButton(
                                text: 'SPIN',
                                h1: h / 8,
                                h2: h / 9.5,
                                tap: () {},
                              )),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(
                  //   height: h * 0.01,
                  // ),
                  // isbutton
                  //     ? Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 50),
                  //         child: ButtonWidget(
                  //             text: 'PLAY',
                  //             onTap: () {
                  //               selected
                  //                   .add(Fortune.randomInt(0, items.length));
                  //             },
                  //             color: HexColor('#7F84AE'),
                  //             high: 90),
                  //       )
                  //     : Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 50),
                  //         child: ButtonWidget(
                  //             text: 'PLAY',
                  //             onTap: () {},
                  //             color: Colors.grey,
                  //             high: 50),
                  //       ),
                  // ? InkWell(
                  //     onTap: () {
                  //       selected.add(Fortune.randomInt(0, items.length));
                  //       // setState(() {
                  //       //   isbutton = false;
                  //       // });
                  //     },
                  //     child: Container(
                  //       width: 150,
                  //       height: 50,
                  //       color: Colors.blue,
                  //       child: const Center(child: Text('Press the button')),
                  //     ),
                  //   )
                  // : Container(
                  //     width: 150,
                  //     height: 50,
                  //     color: Colors.grey,
                  //     child: const Center(child: Text('Press the button')),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
