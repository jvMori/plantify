import 'package:fluttertoast/fluttertoast.dart';
import 'package:plantify/common/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

makeToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: darkColor,
    textColor: white,
    fontSize: 16.sp,
  );
}
