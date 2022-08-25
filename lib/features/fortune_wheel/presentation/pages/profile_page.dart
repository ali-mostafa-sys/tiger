import 'package:flutter/material.dart';

import 'package:tiger/core/localizations/app_loaclizations.dart';
import 'package:tiger/core/widgets/text_form_field_widget.dart';
import 'package:tiger/features/fortune_wheel/presentation/widgets/button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/home_page.png"),
                  fit: BoxFit.cover)),
        ),
        Container(
          color: Colors.black.withOpacity(0.3),
        ),
        Container(
          width: w,
          height: h * 0.74,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(33),
              topLeft: Radius.circular(33),
            ),
          ),
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: h * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormWidget(
                    controller: firstName,
                    labelText: 'First Name',
                    textInputType: TextInputType.text,
                    validator: (value) {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormWidget(
                    controller: lastName,
                    labelText: 'Last Name',
                    textInputType: TextInputType.text,
                    validator: (value) {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormWidget(
                    controller: email,
                    labelText: 'Email'.tr(context),
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email should not be empty'.tr(context);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormWidget(
                    controller: password,
                    labelText: 'Password'.tr(context),
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Password must be more than 8 characters'
                            .tr(context);
                      } else if (value.length > 20) {
                        return 'Password should not be more than 20 characters'
                            .tr(context);
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 40),
                    child: CustomButton(hexaColor1: '#6B5A7E',hexaColor2: '#5A4D68',
                      text: "Update",
                        h1: h*0.09,
                        h2:  h*0.08,
                        tap: (){
                        if(formKey.currentState!.validate()){
                          return null;
                        }
                        },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: h*0.65),
          width: w*0.4,
          height: w*0.4,
          decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color:  Colors.grey,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade900,
                ),
                const BoxShadow(
                  color:  Colors.grey,
                  spreadRadius: -1.0,
                  blurRadius: 20.0,
                ),
              ],
              image: const DecorationImage(
                image:
                AssetImage('assets/images/8.png'),
                fit: BoxFit.cover
              )),
        ),
      ],
    );
  }
}
