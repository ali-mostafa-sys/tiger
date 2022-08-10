

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tiger/core/app_theme.dart';
import 'package:tiger/core/routes/routes.gr.dart';

import 'package:tiger/core/widgets/button_widget.dart';
import 'package:tiger/core/widgets/google_button_widget.dart';
import 'package:tiger/core/widgets/text_form_field_widget.dart';
import 'package:tiger/features/auth/presentation/pages/register_screen/register_screen.dart';

import 'package:tiger/features/auth/presentation/widgets/bottom_text_widget.dart';
import 'package:tiger/features/auth/presentation/widgets/uo_login_register_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(
          context: context,
        ),
      ),
    );
  }

  Widget _buildBody({
    required BuildContext context,
  }) {
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            UpLoginRegisterWidget(text: 'LOG IN'),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 42, top: 25, right: 42, bottom: 15),
                child: Column(
                  children: [
                    TextFormWidget(
                      controller: email,
                      labelText: 'Email',
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email),
                      validator: (value) {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextFormWidget(
                      controller: password,
                      labelText: 'Password',
                      textInputType: TextInputType.text,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.visibility)),
                      validator: (value) {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ButtonWidget(text: 'LOG IN', onTap: () {}),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    GoogleButtonWidget(
                      onTap: () {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    BottomTextWidget(firstText: 'Don\'t have an Account ?', secondText: 'Sign Up', onTap: (){
                     AutoRouter.of(context).pushAndPopUntil( RegisterRoute(), predicate: (route)=>false);


                    })

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
