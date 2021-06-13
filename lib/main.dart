import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantify/common/colors.dart';
import 'package:plantify/features/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),
      builder:()=> MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: Splash(),
      ),
    );
  }
}

