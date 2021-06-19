import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:plantify/common/base_input.dart';
import 'package:plantify/common/colors.dart';
import 'package:plantify/features/auth/presentation/bloc/text_input_cubit.dart';
import 'package:plantify/features/auth/presentation/widgets/text_input.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
                  height: 360.h,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Form(
                    child: Column(
                  children: [
                    BlocProvider(
                      create: (_) => TextInputCubit(),
                      child: TextInput(
                        hintText: 'First name',
                      ),
                    )
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
