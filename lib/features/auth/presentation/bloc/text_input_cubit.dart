import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_field_validator/form_field_validator.dart';

part 'text_input_state.dart';

class TextInputCubit extends Cubit<TextInputState> {
  TextInputCubit(this.nameValidator) : super(TextInputInitial());
  final MultiValidator nameValidator;

  validate(String value) {
    String errorText = nameValidator.call(value);
    if (errorText != null) {
      emit(TextInputError(errorText));
    } else
      emit(TextInputInitial());
  }
}
