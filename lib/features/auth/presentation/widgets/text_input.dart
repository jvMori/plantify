import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantify/common/base_input.dart';
import 'package:plantify/features/auth/presentation/bloc/text_input_cubit.dart';
import 'package:plantify/features/auth/presentation/bloc/toggle_password_visibility_cubit.dart';
import 'package:plantify/features/auth/presentation/widgets/toggle_password_visibility.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget suffixIcon;
  final bool obscureText;
  final TextInputAction textInputAction;

  const TextInput({
    Key key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText, this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextInputCubit, TextInputState>(
        builder: (context, state) {
      var cubit = context.watch<TextInputCubit>();
      return BaseInput(
        hintText: hintText,
        controller: controller,
        obscureText: obscureText,
        suffixIcon: suffixIcon,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        hasError: state is TextInputError,
        errorText: state is TextInputError ? state.text : "",
        onChanged: cubit.validate,
      );
    });
  }
}
