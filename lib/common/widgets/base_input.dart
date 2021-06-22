import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class BaseInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool? hasError;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final bool? enabled;

  const BaseInput({
    required Key key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.hasError,
    this.errorText,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
    this.textInputAction,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _hasError = hasError ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          enabled: enabled,
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: textInputAction ?? TextInputAction.next,
          style: TextStyle(
            color: _hasError ? Colors.redAccent : darkColor,
            fontSize: 18.sp,
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            filled: true,
            fillColor: white,
            hintText: hintText,
            hintStyle: TextStyle(color: _hasError ? Colors.redAccent : gray),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderSide: _hasError ? BorderSide(color: Colors.redAccent) : BorderSide.none,
              borderRadius: BorderRadius.circular(5.w),
            ),
            enabledBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderSide: _hasError ? BorderSide(color: Colors.redAccent) : BorderSide.none,
              borderRadius: BorderRadius.circular(5.w),
            ),
            border: OutlineInputBorder(
              gapPadding: 0.0,
              borderSide: _hasError ? BorderSide(color: Colors.redAccent) : BorderSide.none,
              borderRadius: BorderRadius.circular(5.w),
            ),
          ),
        ),
        if (_hasError)
          Padding(
            padding: EdgeInsets.only(top: 8.w),
            child: Text(
              errorText ?? "",
              style: TextStyle(color: Colors.redAccent, fontSize: 11.sp),
            ),
          )
      ],
    );
  }
}
