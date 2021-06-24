import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantify/common/dependencies/dependencies.dart';
import 'package:plantify/common/validation/validation.dart';
import 'package:plantify/common/widgets/basic_button.dart';
import 'package:plantify/common/widgets/loading_widget.dart';
import 'package:plantify/common/widgets/make_toast.dart';
import 'package:plantify/features/auth/data/register_data.dart';
import 'package:plantify/features/auth/domain/auth_repository.dart';
import 'package:plantify/features/auth/presentation/bloc/register_screen_cubit.dart';
import 'package:plantify/features/auth/presentation/bloc/result.dart';
import 'package:plantify/features/auth/presentation/bloc/text_input_cubit.dart';
import 'package:plantify/features/auth/presentation/bloc/toggle_password_visibility_cubit.dart';
import 'package:plantify/features/auth/presentation/widgets/password_input.dart';
import 'package:plantify/features/auth/presentation/widgets/text_input.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterScreenCubit(getIt<AuthRepository>()),
      child: Register(),
    );
  }
}

class Register extends StatelessWidget {
  final passwordCubit = TextInputCubit(passwordValidator);
  final firstNameCubit = TextInputCubit(textValidator);
  final lastNameCubit = TextInputCubit(textValidator);
  final emailCubit = TextInputCubit(emailValidator);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/register_bg_1.png",
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.6, 1],
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 110.h,
                ),
                SizedBox(
                  height: 120.h,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<RegisterScreenCubit, Result>(
            builder: (context, state) {
              var cubit = context.watch<RegisterScreenCubit>();
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(30.w),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 2 * 30.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Form(
                            child: Column(
                          children: [
                            BlocProvider(
                              create: (_) => firstNameCubit,
                              child: TextInput(
                                hintText: 'First name',
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            BlocProvider(
                              create: (_) => lastNameCubit,
                              child: TextInput(
                                hintText: 'Last name',
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            BlocProvider(
                              create: (_) => emailCubit,
                              child: TextInput(
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (_) => passwordCubit,
                                ),
                                BlocProvider(
                                  create: (_) => TogglePasswordVisibilityCubit(),
                                ),
                              ],
                              child: PasswordInput(
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            signUpButton(
                                  state,
                                  cubit,
                                  [firstNameCubit, lastNameCubit, emailCubit, passwordCubit],
                                ) ??
                                Text(""),
                            SizedBox(
                              height: 40.h,
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget button(RegisterScreenCubit cubit, List<Validation> fields) => BasicButton(
        "Sign up",
        width: 250.w,
        onClick: () {
          cubit.signUp(
            fields,
            RegisterData(
              emailCubit.getValue(),
              firstNameCubit.getValue(),
              lastNameCubit.getValue(),
              passwordCubit.getValue(),
            ),
          );
        },
      );

  Widget? signUpButton(Result state, RegisterScreenCubit cubit, List<Validation> fields) {
    return state.when(
      () => button(cubit, fields),
      loading: () => SizedBox(
        height: 50.w,
        child: LoadingWidget(
          size: 30.w,
        ),
      ),
      error: (message) {
        makeToast(message ?? "Something went wrong");
        return button(cubit, fields);
      },
      success: (data) => button(cubit, fields),
    );
  }
}
