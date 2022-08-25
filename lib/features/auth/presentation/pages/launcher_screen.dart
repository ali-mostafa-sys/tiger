import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tiger/core/strings/consts.dart';

import '../../../../core/routes/routes.gr.dart';
import '../widgets/money_animation_widget.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  _LauncherScreenState createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  bool _display = false;

  @override
  void initState() {
    super.initState();
    _display = true;
    Future.delayed(const Duration(seconds: 11, milliseconds: 500), () {
      if (TOKEN == '') {
        AutoRouter.of(context)
            .pushAndPopUntil(LoginRoute(), predicate: (route) => false);
      } else {
        AutoRouter.of(context).pushAndPopUntil(const HomePageRoute(),
            predicate: (route) => false);
      }

      // Prints after 1 second.
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rainRow = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RainWidget(display: _display, duration: 9, delay: 3),
          RainWidget(display: _display, duration: 9, delay: 3),
          RainWidget(display: _display, duration: 10, delay: 3),
          RainWidget(display: _display, duration: 10, delay: 3),
        ],
      ),

      //////////////////////////////////////
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RainWidget(
            display: _display,
            duration: 10,
            delay: 2,
          ),
          RainWidget(display: _display, duration: 9, delay: 2),
          RainWidget(display: _display, duration: 11, delay: 2),
          RainWidget(display: _display, duration: 10, delay: 2),
        ],
      ),
      //////////////////////////////////////
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RainWidget(
            display: _display,
            duration: 10,
            delay: 1,
          ),
          RainWidget(
            display: _display,
            duration: 8,
            delay: 1,
          ),
          RainWidget(
            display: _display,
            duration: 11,
            delay: 1,
          ),
          RainWidget(
            display: _display,
            duration: 9,
            delay: 1,
          ),
        ],
      ),
      // //////////////////////////////////////
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RainWidget(
            display: _display,
            duration: 9,
            delay: 0,
          ),
          RainWidget(
            display: _display,
            duration: 11,
            delay: 0,
          ),
          RainWidget(
            display: _display,
            duration: 9,
            delay: 0,
          ),
          RainWidget(
            display: _display,
            duration: 10,
            delay: 0,
          ),
        ],
      ),
    ];
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/1.png'),
                fit: BoxFit.cover,
              )),
            ),
            //////////////////////////////
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            /////////////////////////////////
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: rainRow.map((e) {
                  return e;
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
