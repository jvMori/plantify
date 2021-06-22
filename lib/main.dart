import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:plantify/common/utils/colors.dart';
import 'package:plantify/features/splash/splash.dart';

import 'common/dependencies/dependencies.dart';

final logger = Logger();

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: Splash(),
      ),
    );
  }
}
