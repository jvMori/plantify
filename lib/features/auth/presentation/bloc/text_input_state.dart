part of 'text_input_cubit.dart';

abstract class TextInputState extends Equatable {
  const TextInputState();
}

class TextInputInitial extends TextInputState {
  TextInputInitial();

  @override
  List<Object> get props => [];
}

class TextInputError extends TextInputState {
  final String? text;

  TextInputError(this.text);

  @override
  List<Object?> get props => [text];
}
