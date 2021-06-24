import 'package:form_field_validator/form_field_validator.dart';
import 'package:plantify/common/validation/password_validator.dart';

mixin ValidationMixin {
  bool isFieldEmpty(String? fieldValue) => fieldValue?.isEmpty ?? true;

  bool validateEmailAddress(String? email) {
    if (email == null) {
      return false;
    }

    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool isLessThanAndNotEmpty(int limit, String value) {
    return value != null && value.isNotEmpty && value.length <= 100;
  }

  bool validatePassword(String? value) {
    if (value == null) return false;
    if (value.isEmpty) return false;

    // (?=.*[A-Z])       // should contain at least one upper case
    //   (?=.*[a-z])       // should contain at least one lower case
    //   (?=.*?[0-9])          // should contain at least one digit
    // (?=.*?[!@#\$&*~]).{8,}  // should contain at least one Special character

    var size = value.length >= 6;
    var contains = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}').hasMatch(value);
    return size && contains;
  }

  bool validateCardNumber(String? value) {
    if (value == null) return false;
    return value.length > 4;
  }

  bool validField(String? value) {
    if (value == null) return false;

    return value.length > 3;
  }

  bool validFullName(String? value) {
    if (value == null) return false;

    RegExp nameRegex = RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$", caseSensitive: false);

    return value.length > 2 && nameRegex.hasMatch(value);
  }
}

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'This field is required.'),
  PasswordValidator(),
]);

final textValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'This field is required.'),
    MinLengthValidator(2, errorText: 'Name must be at least 2 characters long.'),
    PatternValidator(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$",
        errorText: 'Name must contain only alphabetical characters.')
  ],
);

final emailValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'This field is required.'),
    EmailValidator(errorText: 'Please provide correct email address.')
  ],
);
