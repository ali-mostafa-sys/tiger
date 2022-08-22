// import 'package:flutter/material.dart';
// import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:rxdart/rxdart.dart';


// import '../widgets/wheel_item_widget.dart';

// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);

//   final selected = BehaviorSubject<int>();

//   final List<int> items = [100, 1000, 500, 200, 300, 350, 50, 80];

//   final int reward = 0;

//   final bool isbutton = true;

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           alignment: Alignment.center,
//           children: [
//             //// background
//             Container(
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/home_page.png'),
//                       fit: BoxFit.cover)),
//             ),
//             //////////////////////////////
//             Container(
//               color: Colors.black.withOpacity(0.3),
//             ),
//             /////////////////////////////////
//             Padding(
//               padding:
//                   EdgeInsets.only(bottom: h * 0.1, right: 5, left: 5, top: 20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   /// 1
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Container(
//                               width: 55,
//                               height: 52,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.red,
//                               ),
//                             ),
//                             Container(
//                               width: 30,
//                               height: 35,
//                               decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                       image: AssetImage(
//                                           'assets/icon-navigation.png'),
//                                       fit: BoxFit.cover)),
//                             ),
//                           ],
//                         ),
//                         ///////////////
//                         const TotalPrizeWidget()
//                       ],
//                     ),
//                   ),

//                   /// 2
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         width: 300,
//                         height: 300,
//                         decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.3),
//                             shape: BoxShape.circle),
//                       ),
//                       ///////////////////////
//                       SizedBox(
//                         width: 280,
//                         height: 280,
//                         child: FortuneWheel(
//                           indicators: <FortuneIndicator>[
//                             FortuneIndicator(
//                               alignment: Alignment.topCenter,
//                               child: TriangleIndicator(
//                                 color: HexColor('#44A6C0'),
//                               ),
//                             ),
//                           ],
//                           animateFirst: false,
//                           selected: selected.stream,
//                           onAnimationEnd: () {
//                             // setState(() {
//                             //   reward = items[selected.value];
//                             //   print(reward);
//                             //   isbutton = true;
//                             // });
//                           },
//                           items: [
//                             for (int i = 0;
//                                 i < items.length;
//                                 i++) ...<FortuneItem>{
//                               i % 2 == 0
//                                   ? FortuneItem(
//                                       style: FortuneItemStyle(
//                                           color: Colors.red,
//                                           borderColor: Colors.red),
//                                       child: WheelItemWidget(
//                                         ucValue: items[i].toString(),
//                                       ),
//                                     )
//                                   : FortuneItem(
//                                       style: FortuneItemStyle(
//                                           color: Colors.red,
//                                           borderColor: Colors.red),
//                                       child: WheelItemWidget(
//                                         ucValue: items[i].toString(),
//                                       ),
//                                     )
//                             }
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: 40,
//                         height: 40,
//                         decoration: const BoxDecoration(
//                             color: Colors.white, shape: BoxShape.circle),
//                       ),
//                       Container(
//                         width: 15,
//                         height: 15,
//                         decoration: BoxDecoration(
//                             color: Colors.red, shape: BoxShape.circle),
//                       ),
//                     ],
//                   ),
//                   // 3 button
//                   isbutton
//                       ? Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 50),
//                           // child: ButtonWidget(
//                           //     text: 'PLAY',
//                           //     onTap: () {
//                           //       selected
//                           //           .add(Fortune.randomInt(0, items.length));
//                           //     },
//                           //     color: Colors.red,
//                           //     high: 90),
//                         )
//                       : Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 50),
//                           // child: ButtonWidget(
//                           //     text: 'PLAY',
//                           //     onTap: () {},
//                           //     color: Colors.grey,
//                           //     high: 50),
//                         ),
//                   // ? InkWell(
//                   //     onTap: () {
//                   //       selected.add(Fortune.randomInt(0, items.length));
//                   //       // setState(() {
//                   //       //   isbutton = false;
//                   //       // });
//                   //     },
//                   //     child: Container(
//                   //       width: 150,
//                   //       height: 50,
//                   //       color: Colors.blue,
//                   //       child: const Center(child: Text('Press the button')),
//                   //     ),
//                   //   )
//                   // : Container(
//                   //     width: 150,
//                   //     height: 50,
//                   //     color: Colors.grey,
//                   //     child: const Center(child: Text('Press the button')),
//                   //   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
