import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantify/common/utils/colors.dart';

class TogglePasswordVisibility extends StatelessWidget {
  final Function()? onClick;
  final bool visible;

  const TogglePasswordVisibility({Key? key, required this.visible, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        !visible ? Icons.visibility_off : Icons.visibility,
        color: darkColor,
      ),
      onPressed: onClick,
    );
  }
}
