

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tiger/core/app_theme.dart';
import 'package:tiger/core/widgets/button_widget.dart';
import 'package:tiger/core/widgets/google_button_widget.dart';
import 'package:tiger/core/widgets/text_form_field_widget.dart';
import 'package:tiger/features/auth/presentation/pages/login_screen/login_screen.dart';
import 'package:tiger/features/auth/presentation/widgets/bottom_text_widget.dart';
import 'package:tiger/features/auth/presentation/widgets/uo_login_register_widget.dart';
class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController invitationCode = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );


  }
  Widget _buildBody(BuildContext context){
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            UpLoginRegisterWidget(text: 'SIGN UP'),
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
                      onTap: (){},
                      validator: (value) {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextFormWidget(
                      controller: phoneNumber,
                      labelText: 'Phone Number',
                      textInputType: TextInputType.phone,
                      prefixIcon: Icon(Icons.phone),
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
                    TextFormWidget(
                      controller: rePassword,
                      labelText: 'Re-Password',
                      textInputType: TextInputType.text,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.visibility)),
                      validator: (value) {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextFormWidget(
                      controller: invitationCode,
                      labelText: 'Invitation Code',
                      textInputType: TextInputType.text,
                      prefixIcon: Icon(Icons.email),

                      validator: (value) {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ButtonWidget(text: 'SIGN UP', onTap: () {}),


                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    BottomTextWidget(firstText: 'Already have an Account?', secondText: 'Log in', onTap: (){
                      AutoRouter.of(context).pushNamed('/login');
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
