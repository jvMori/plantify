import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantify/common/widgets/base_input.dart';
import 'package:plantify/features/auth/presentation/bloc/text_input_cubit.dart';

class TextInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputAction? textInputAction;

  const TextInput({
    Key? key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextInputCubit, TextInputState>(builder: (context, state) {
      var cubit = context.watch<TextInputCubit>();
      return BaseInput(
        key: key ?? Key("Text input"),
        hintText: hintText ?? "",
        controller: controller,
        obscureText: obscureText ?? false,
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
