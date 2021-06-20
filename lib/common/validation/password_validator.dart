import 'package:form_field_validator/form_field_validator.dart';
import 'package:plantify/common/validation/validation.dart';

class PasswordValidator extends TextFieldValidator with ValidationMixin {
  PasswordValidator(
      {String errorText =
          "Password must contain at least 6 characters, one upper case and one special character."})
      : super(errorText);

  @override
  bool isValid(String? value) {
    return validatePassword(value);
  }
}
