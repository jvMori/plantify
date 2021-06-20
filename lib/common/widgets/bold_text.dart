import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantify/common/colors.dart';

class BoldText extends StatelessWidget {
  final String? text;
  final Color? color;
  final TextAlign? align;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? fontSize;

  const BoldText(this.text, {Key? key, this.color, this.align, this.fontWeight, this.letterSpacing, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text?.toUpperCase() ?? "",
      textAlign: align,
      style: TextStyle(
        color: color ?? darkColor,
        fontFamily: 'Inter',
        fontSize: fontSize ?? 13.sp,
        letterSpacing: letterSpacing ?? 1.1,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }
}
