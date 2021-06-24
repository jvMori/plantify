import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantify/features/auth/data/register_data.dart';
import 'package:plantify/features/auth/domain/auth_repository.dart';
import 'package:plantify/features/auth/presentation/bloc/result.dart';
import 'package:plantify/features/auth/presentation/bloc/text_input_cubit.dart';

part 'register_screen_state.dart';

class RegisterScreenCubit extends Cubit<Result> {
  RegisterScreenCubit(this.repository) : super(Result());

  final AuthRepository repository;

  signUp(List<Validation> fieldsToValidate, RegisterData registerData) async {
    if (!_fieldsAreValid(fieldsToValidate)) return;
    emit(Result.loading());
    final result = await repository.register(registerData);
    emit(result);
  }

  bool _fieldsAreValid(List<Validation> fieldsToValidate) {
    List<bool> results = [];
    for (int i = 0; i < fieldsToValidate.length; i++) {
      var element = fieldsToValidate[i];
      bool valid = element.validate();
      results.add(valid);
    }
    bool valid = !results.contains(false);
    return valid;
  }
}
