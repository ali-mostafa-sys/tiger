import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger/core/app_theme.dart';

import 'package:tiger/core/localizations/app_loaclizations.dart';
import 'package:tiger/core/routes/routes.gr.dart';
import 'package:tiger/core/strings/consts.dart';
import 'package:tiger/core/utils/snachbar_message.dart';
import 'package:tiger/core/widgets/button_widget.dart';
import 'package:tiger/core/widgets/google_button_widget.dart';
import 'package:tiger/core/widgets/loading_widget.dart';
import 'package:tiger/core/widgets/text_form_field_widget.dart';
import 'package:tiger/features/auth/domain/entity/login_entity.dart';
import 'package:tiger/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:tiger/features/auth/presentation/widgets/bottom_text_widget.dart';
import 'package:tiger/features/auth/presentation/widgets/uo_login_register_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoadedLoginState) {
          if (state.userDataEntity.status == 200) {
            SnackBarMessage().showSnackBar(
                message: state.userDataEntity.message.toString(),
                backgroundColor: Colors.green,
                context: context);

            /// here you can send data
            AutoRouter.of(context)
                .pushAndPopUntil(HomePageRoute(), predicate: (route) => false);
          } else {
            SnackBarMessage().showSnackBar(
                message: state.userDataEntity.message.toString(),
                backgroundColor: Colors.redAccent,
                context: context);
          }
        }
        if (state is ErrorLoginState) {
          SnackBarMessage().showSnackBar(
              message: state.error.toString(),
              backgroundColor: Colors.redAccent,
              context: context);
        }
      },
      builder: (context, state) {
        var bloc = LoginBloc.get(context);
        if (state is LoadingLoginState) {
          return const LoadingWidget();
        }
        return GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: primaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                UpLoginRegisterWidget(text: 'LOG IN'.tr(context)),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 42, top: 25, right: 42, bottom: 15),
                    child: Column(
                      children: [
                        TextFormWidget(
                          controller: bloc.email,
                          labelText: 'Email'.tr(context),
                          textInputType: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.email),
                          validator: (value) {
                            if (!RegExp(VALIDATION_EMAIL).hasMatch(value)) {
                              return 'Pleas insert a correct Email'.tr(context);
                            } else if (value.isEmpty) {
                              return 'Email should not be empty'.tr(context);
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        TextFormWidget(
                          controller: password,
                          labelText: 'Password'.tr(context),
                          obscureText: bloc.obscureText,
                          textInputType: TextInputType.text,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              bloc.add(ObscureTextEvent());
                            },
                            icon: Icon(bloc.obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          validator: (value) {
                            if (value!.length < 8) {
                              return 'Password must be more than 8 characters'
                                  .tr(context);
                            } else if (value.length > 20) {
                              return 'Password should not be more than 20 characters '
                                  .tr(context);
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        ButtonWidget(
                            text: 'LOG IN'.tr(context),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                final loginEntity = LoginEntity(
                                    email: bloc.email.text.toString(),
                                    password: password.text.toString());
                                bloc.add(
                                    LoginButtonEvent(loginEntity: loginEntity));
                              }
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        GoogleButtonWidget(
                          onTap: () {
                            bloc.add(GetEmailAndFullNameEvent());
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        BottomTextWidget(
                            firstText: 'Do not have an Account?'.tr(context),
                            secondText: 'SIGN UP'.tr(context),
                            onTap: () {
                              AutoRouter.of(context).pushNamed('/register');
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
