import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tiger/core/localizations/app_loaclizations.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/button.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/first_container.dart';

// ignore: must_be_immutable
class PrizeDialogWidget extends StatelessWidget {
  final int reward;
  bool isPop = false;

  PrizeDialogWidget({Key? key, required this.reward}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => isPop,
      child: SimpleDialog(
        title: Center(
            child: AutoSizeText(
          'CONGRATS'.tr(context),
          style: TextStyle(
              color: HexColor('#504E78'),
              fontWeight: FontWeight.bold,
              fontSize: 35),
        )),
        backgroundColor: HexColor('#B1B3C5'),
        children: [
          Container(
            width: w / 2.5,
            height: w / 2.5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/win_icon.png'),
                    fit: BoxFit.contain)),
          ),
          ////////////////////
          SizedBox(
            height: h * 0.01,
          ),
          ///////////////
          Center(
            child: AutoSizeText(
              'YOU WIN'.tr(context),
              style: TextStyle(
                  color: HexColor('#504E78'),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          ///////////////
          SizedBox(
            height: h * 0.01,
          ),
          //////////////
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.23),
            child: FirstContainerWidget(
                text: reward.toString(), fontSize: 20, width: double.infinity),
          ),
          ///////////////
          SizedBox(
            height: h * 0.03,
          ),
          //////////////
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              hexaColor1: '#6B5A7E',
              hexaColor2: '#5A4D68',
              text: 'CONTINUE'.tr(context),
              textSize: 20,
              h1: h * 0.075,
              h2: h * 0.065,
              tap: () {
                isPop = true;
                AutoRouter.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
