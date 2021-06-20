import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantify/common/colors.dart';
import 'package:plantify/features/auth/presentation/bloc/toggle_password_visibility_cubit.dart';

class TogglePasswordVisibility extends StatelessWidget {
  final Function onClick;
  final bool visible;

  const TogglePasswordVisibility({Key key, this.visible, this.onClick})
      : super(key: key);

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
