import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class BasicText extends StatelessWidget {
  final String text;

  const BasicText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Noway',
        color: white,
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
      ),
    );
  }
}
