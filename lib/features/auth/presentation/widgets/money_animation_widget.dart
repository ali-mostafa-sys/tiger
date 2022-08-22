import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';

class RainWidget extends StatefulWidget {
  final bool display;
  final double minHigh;
  final int duration;
  final int delay;

  const RainWidget({
    Key? key,
    required this.display,
    this.minHigh = -500,
    required this.duration,
    required this.delay,
  }) : super(key: key);

  @override
  State<RainWidget> createState() => _RainWidgetState();
}

class _RainWidgetState extends State<RainWidget> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return TranslationAnimatedWidget(
      delay: Duration(seconds: widget.delay),
        enabled: widget.display,
        values: [
          Offset(0, widget.minHigh),
          Offset(0, h),
        ],
        duration: Duration(seconds: widget.duration),
        child: Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            // color: Colors.red,
              image: DecorationImage(
                  image: AssetImage('assets/images/6.png'), fit: BoxFit.cover)),
        ));
  }
}