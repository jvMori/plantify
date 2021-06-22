import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plantify/common/utils/colors.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;

  const LoadingWidget({Key? key, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color ?? white,
      size: size ?? 50.w,
    );
  }
}
