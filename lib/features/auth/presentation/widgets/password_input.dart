import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantify/features/auth/presentation/bloc/toggle_password_visibility_cubit.dart';
import 'package:plantify/features/auth/presentation/widgets/text_input.dart';
import 'package:plantify/features/auth/presentation/widgets/toggle_password_visibility.dart';

class PasswordInput extends StatelessWidget {
  final TextInputAction textInputAction;

  const PasswordInput({Key key, this.textInputAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglePasswordVisibilityCubit, TogglePasswordVisibilityState>(
      builder:(context, state) => TextInput(
        hintText: 'Password',
        keyboardType: TextInputType.visiblePassword,
        obscureText:  state is PasswordVisible,
        textInputAction: textInputAction,
        suffixIcon: TogglePasswordVisibility(
          visible: state is PasswordInvisible,
          onClick: context.watch<TogglePasswordVisibilityCubit>().handleVisibility,
        ),
      ),
    );
  }
}
