import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantify/common/base_bg.dart';
import 'package:plantify/common/colors.dart';
import 'package:plantify/features/auth/presentation/screens/register_screen.dart';
import 'package:plantify/features/splash/splash_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseBg(
        child: BlocProvider(
          create: (_) => SplashCubit(),
          child: SplashBody(),
        ),
      ),
    );
  }
}

class SplashBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(builder: (context, state) {
      var cubit = context.watch<SplashCubit>();
      if (state is SplashInitial) cubit.init();
      return SafeArea(
        child: splashInit(context),
      );
    }, listener: (context, state) {
      if (state is SplashLoaded) {
        splashLoaded(context);
      }
    });
  }

  Widget splashInit(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 50.h,
            left: 0,
            right: 0,
            child: SizedBox(
                height: 360.h,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fitHeight,
                ))),
        Positioned(
          top: 130.h,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 700.h,
            child: Image.asset(
              "assets/images/splash_1.png",
              fit: BoxFit.fitHeight,
            ),
          ),
        )
      ],
    );
  }

  splashLoaded(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return RegisterScreen();
    }));
  }
}
