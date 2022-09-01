import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tiger/core/localizations/app_loaclizations.dart';

import 'package:tiger/core/widgets/loading_widget.dart';

import 'package:tiger/features/fortune_wheel/presentation/bloc/ads_and_rate/ads_and_rate_bloc.dart';

import 'package:tiger/features/fortune_wheel/presentation/widgets/bubble_bar.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/button.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/first_container.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/prize_dialog.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/right_bar.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/shop_dialog.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/wheel_widget.dart';
import '../bloc/wheel/wheel_bloc.dart';
import '../widgets/rightbarwidget.dart';

class WheelPage extends StatelessWidget {
  const WheelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          //////
          body: BlocConsumer<WheelBlocBloc, WheelState>(
        listener: (context, state) {

          print(state);
          if (state is ShowUcValueDialogState) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return PrizeDialogWidget(
                    reward: state.reward,
                    // isPop: WheelBlocBloc.get(context).isPop ,
                    // onTap: (){
                    //   final wheelEntity=WheelEntity(ucValue: state.reward);
                    //   WheelBlocBloc.get(context).add(AddToPointsEvent(
                    //      //token: TOKEN.toString(), wheelEntity: wheelEntity
                    //   ));
                    //
                    // },

                  );
                });
          }
          if (state is ShowShopDialogState) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ShopDialogWidget();
                });
          }
        },
        builder: (context, state) {
          var bloc = WheelBlocBloc.get(context);
          if(bloc.userInfoEntity==null){
            return const LoadingWidget();
          }
          if(bloc.wheelItems.length<10){
            return const LoadingWidget();
          }

          return Stack(
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
                color: Colors.black.withOpacity(0.4),
              ),
              /////////////////////////////////
              Padding(
                padding: const EdgeInsets.only(bottom: 13, top: 0),
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


                            ucValueItem(w,'${bloc.userInfoEntity!.points}'),
                            //2
                            logOutItem(w, context),
                            //3
                            profileItem(w,bloc.userInfoEntity!.firstName,bloc.userInfoEntity!.lastName),
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
                          Align(
                            alignment: Alignment.topRight,
                            child: RightBar(
                                tap1: () {
                                  bloc.add(ShowShopDialogEvent());
                                },
                                tap2: () {

                                }),
                          ),
                          //////////ads btton
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: (w / 5) -20,
                                height: (w / 5) -20,
                                child: RightBarWidget(
                                  img: 'assets/images/adwords.png',
                                  text: 'AD',
                                  textSize: 12,
                                  tap: () {
                                    AdsAndRateBloc.get(context).add(ShowAdsEvent());
                                  },
                                ),
                              ),
                            ),
                          ),
                          ///////// wheel
                          Align(
                            alignment: Alignment.center,
                            child: WheelWidget(
                              onWheelEnd: () {
                                print('wheel end');
                                bloc.add(ShowUcValueDialogEvent());
                              },
                              items: bloc.wheelItems,
                              selected: bloc.selected,
                              remainRoll: bloc.userInfoEntity!.numberOfRolls.toString(),
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
                                  hexaColor1: bloc.buttonColor1,
                                  hexaColor2: bloc.buttonColor2,
                                  text: 'SPIN'.tr(context),
                                  h1: h / 9,
                                  h2: h / 10.5,
                                  tap: () {
                                    if(bloc.userInfoEntity!.numberOfRolls>0){
                                      if (bloc.isPressed == false) {
                                        bloc.add(PressWheelButtonEvent());
                                      } else {
                                        print('you cant');
                                      }
                                    }


                                  },
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      )),
    );
  }

  Widget ucValueItem(double w, String points) {
    return SizedBox(
      width: w / 3,
      height: 65,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: FirstContainerWidget(
              width: w / 4,
              text: '$points',
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
    );
  }

  Widget logOutItem(double w, context) {
    return FirstContainerWidget(
      width: w / 4.3,
      text: 'LogOut'.tr(context),
      fontSize: 15,
    );
  }

  Widget profileItem(double w,String firstName,String lastName) {
    return SizedBox(
      width: w / 3.2,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          FirstContainerWidget(
            width: w / 4.1,
            text: '$firstName'+'$lastName',
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
                    image: AssetImage('assets/images/8.png'),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
