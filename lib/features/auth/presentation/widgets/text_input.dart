import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantify/common/base_input.dart';
import 'package:plantify/features/auth/presentation/bloc/text_input_cubit.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const TextInput({Key key, this.hintText, this.controller, this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextInputCubit, TextInputState>(
        builder: (context, state) {
      var cubit = context.watch<TextInputCubit>();
      return BaseInput(
        hintText: hintText,
        controller: controller,
        keyboardType: keyboardType,
        hasError: state is TextInputError,
        errorText: state is TextInputError ? state.text : "",
        onChanged: cubit.validate,
      );
    });
  }
}
