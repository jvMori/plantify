import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_field_validator/form_field_validator.dart';

part 'text_input_state.dart';

class TextInputCubit extends Cubit<TextInputState> implements Validation {
  TextInputCubit(this.nameValidator) : super(TextInputInitial());
  final FieldValidator nameValidator;
  String? _errorText = "";
  String _value = "";

  getValue() => _value;

  onValueChanged(String value) {
    _value = value;
    _errorText = nameValidator.call(value);
    if (_errorText != null) {
      emit(TextInputError(_errorText));
    } else
      emit(TextInputInitial());
  }

  @override
  bool validate() {
    onValueChanged(_value);
    return _errorText == null;
  }
}

abstract class Validation {
  bool validate();
}
