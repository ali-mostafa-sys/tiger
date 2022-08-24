import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiger/core/app_theme.dart';

import 'package:tiger/core/localizations/app_loaclizations.dart';
import 'package:tiger/core/utils/snachbar_message.dart';
import 'package:tiger/core/widgets/button_widget.dart';
import 'package:tiger/core/widgets/loading_widget.dart';

import 'package:tiger/core/widgets/text_form_field_widget.dart';
import 'package:tiger/features/auth/domain/entity/register_entity.dart';
import 'package:tiger/features/auth/presentation/bloc/register_bloc/register_bloc.dart';

import 'package:tiger/features/auth/presentation/widgets/bottom_text_widget.dart';
import 'package:tiger/features/auth/presentation/widgets/uo_login_register_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController invitationCode = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is LoadedRegisterState) {
          if (state.userDataEntity.status == 200) {
            SnackBarMessage().showSnackBar(
                message: state.userDataEntity.message.toString(),
                backgroundColor: Colors.green,
                context: context);
          } else {
            SnackBarMessage().showSnackBar(
                message: state.userDataEntity.message.toString(),
                backgroundColor: Colors.redAccent,
                context: context);
          }
        }
        if (state is ErrorRegisterState) {
          SnackBarMessage().showSnackBar(
              message: state.error.toString(),
              backgroundColor: Colors.redAccent,
              context: context);
        }
      },
      builder: (context, state) {
        var bloc = RegisterBloc.get(context);
        if (state is LoadingRegisterState) {
          return const LoadingWidget();
        }
        return GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: primaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                UpLoginRegisterWidget(text: 'SIGN UP'.tr(context)),
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
                          onTap: () {
                            bloc.add(GetEmailAndFullNameEvent());
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email should not be empty'.tr(context);
                            }
                          },
                        ),

                        /// here for choosing country

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
                                  : Icons.visibility_off)),
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        TextFormWidget(
                          controller: rePassword,
                          labelText: 're_password'.tr(context),
                          obscureText: bloc.obscureText,
                          textInputType: TextInputType.text,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                bloc.add(ObscureTextEvent());
                              },
                              icon: Icon(bloc.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          validator: (value) {
                            if (value != password.text) {
                              return 'Password is not much'.tr(context);
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        TextFormWidget(
                          controller: invitationCode,
                          labelText: 'Invitation Code'.tr(context),
                          textInputType: TextInputType.text,
                          prefixIcon: const Icon(Icons.group_add),
                          validator: (value) {},
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        ButtonWidget(
                            text: 'SIGN UP'.tr(context),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                final registerEntity = RegisterEntity(
                                    firstName: bloc.firstName,
                                    lastName: bloc.lastName,
                                    email: bloc.email.text.toString(),
                                    password: password.text,
                                    macAddress: bloc.macAddress,
                                    invitationCode: invitationCode.text);
                                bloc.add(RegisterButtonEvent(
                                    registerEntity: registerEntity));
                              }
                            }),
                        BottomTextWidget(
                            firstText: 'Already have an Account?'.tr(context),
                            secondText: 'LOG IN'.tr(context),
                            onTap: () {
                              AutoRouter.of(context).pushNamed('/profile');
                            }),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        BottomTextWidget(
                            firstText: 'Already have an Account?'.tr(context),
                            secondText: 'LOG IN'.tr(context),
                            onTap: () {
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
      },
    );
  }
}
