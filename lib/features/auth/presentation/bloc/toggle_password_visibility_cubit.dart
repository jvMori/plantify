import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_password_visibility_state.dart';

class TogglePasswordVisibilityCubit
    extends Cubit<TogglePasswordVisibilityState> {
  TogglePasswordVisibilityCubit() : super(PasswordInvisible());
  bool _visible = false;

  handleVisibility() {
    _visible = !_visible;
    if (_visible)
      emit(PasswordVisible());
    else
      emit(PasswordInvisible());
  }
}
