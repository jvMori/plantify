import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function onChanged;
  final bool hasError;
  final String errorText;

  const BaseInput(
      {Key key,
      this.hintText,
      this.controller,
      this.onChanged,
      this.hasError,
      this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _hasError = hasError ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          style: TextStyle(
            color: _hasError ? Colors.redAccent : darkColor,
            fontSize: 18.sp,
          ),
          decoration: InputDecoration(
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
