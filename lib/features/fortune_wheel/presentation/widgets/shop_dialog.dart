import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tiger/core/localizations/app_loaclizations.dart';
import 'package:tiger/features/fortune_wheel/presentation/bloc/wheel/wheel_bloc.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/button.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/first_container.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/shop_widget.dart';

// ignore: must_be_immutable
class ShopDialogWidget extends StatelessWidget {
  bool isPop = false;

  ShopDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocBuilder<WheelBlocBloc, WheelState>(
      /////////////////////////////////////
      builder: (context, state) {
        var bloc = WheelBlocBloc.get(context);
        return WillPopScope(
          onWillPop: () async => isPop,
          child: SimpleDialog(
            backgroundColor: HexColor('#002346'),
            children: [
              /////// 111111111111111
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  width: double.infinity,
                  height: h / 2,
                  color: HexColor('#002346'),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: GridView.builder(
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 1.13,
                          mainAxisSpacing: 7.0,
                          crossAxisSpacing: 7.0,
                          maxCrossAxisExtent: 200,
                        ),
                        itemBuilder: (context, index) {
                          return ShopWidget(
                            ucText: bloc.shopItems[index].toString(),
                            onTap: () {
                              bloc.add(PickShopItemEvent(
                                  shopValue: bloc.shopItems[index]));
                            },
                          );
                        }),
                  ),
                ),
              ),
              /////////////// 22222222222222
              Center(
                child: AutoSizeText(
                  'OrderValue'.tr(context),
                  style: TextStyle(
                      color: HexColor('#C48532'),
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              ///////////////////////
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.23),
                child: FirstContainerWidget(
                    text: bloc.shopValue.toString(),
                    fontSize: 18,
                    width: double.infinity),
              ),

              ///////////////
              SizedBox(
                height: h * 0.05,
              ),
              //////////////3333333333333333333333
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: w * 0.25,
                      child: CustomButton(
                        hexaColor1: '#5E5B4D',
                        hexaColor2: '#464339',
                        text: 'Cancel'.tr(context),
                        textSize: 18,
                        h1: h * 0.055,
                        h2: h * 0.045,
                        tap: () {
                          isPop = true;
                          bloc.shopValue = 0;
                          AutoRouter.of(context).pop();
                        },
                      ),
                    ),
              
                    ///
                    SizedBox(
                      width: w * 0.25,
                      child: CustomButton(
                        hexaColor1: '#5E5B4D',
                        hexaColor2: '#464339',
                        text: 'Order'.tr(context),
                        textSize: 18,
                        h1: h * 0.055,
                        h2: h * 0.045,
                        tap: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
