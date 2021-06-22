import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantify/common/widgets/bold_text.dart';

import '../utils/colors.dart';

class BasicButton extends StatelessWidget {
  final Color? color;
  final String? text;
  final Function()? onClick;
  final double? width;

  const BasicButton(this.text, {Key? key, this.color, this.onClick, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.w,
      width: width ?? 300.w,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: 6.0.w,
              offset: Offset(0.w, 3.w),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(50.0.w),
          ),
        ),
        child: TextButton(
          onPressed: onClick,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0.w),
              side: BorderSide.none,
            )),
            minimumSize: MaterialStateProperty.all(Size(width ?? 550.0.w, 50.0.w)),
            backgroundColor: MaterialStateProperty.all(color ?? accentColor),
          ),
          child: BoldText(
            text,
            color: white,
            fontSize: 17.sp,
            letterSpacing: 3.w,
          ),
        ),
      ),
    );
  }
}
