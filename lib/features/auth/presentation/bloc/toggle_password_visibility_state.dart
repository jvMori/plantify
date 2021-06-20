part of 'toggle_password_visibility_cubit.dart';

@immutable
abstract class TogglePasswordVisibilityState {}

class PasswordInvisible extends TogglePasswordVisibilityState {}
class PasswordVisible extends TogglePasswordVisibilityState {}
