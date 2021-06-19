import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_field_validator/form_field_validator.dart';

part 'text_input_state.dart';

class TextInputCubit extends Cubit<TextInputState> {
  TextInputCubit() : super(TextInputInitial());
  final nameValidator = MultiValidator(
    [
      RequiredValidator(errorText: 'This field is required.'),
      MinLengthValidator(2, errorText: 'Name must be at least 2 characters long.'),
      PatternValidator(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$",
          errorText: 'Name must contain only alphabetical characters.')
    ],
  );

  validate(String value) {
    String errorText = nameValidator.call(value);
    if (errorText != null){
      emit(TextInputError(errorText));
    }
    else
      emit(TextInputInitial());
  }
}
