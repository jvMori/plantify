import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantify/features/auth/data/register_data.dart';
import 'package:plantify/features/auth/domain/auth_repository.dart';
import 'package:plantify/features/auth/presentation/bloc/result.dart';

part 'register_screen_state.dart';

class RegisterScreenCubit extends Cubit<Result> {
  RegisterScreenCubit(this.repository) : super(Result());

  final AuthRepository repository;

  signUp() async {
    emit(Result.loading());
    final result = await repository.register(RegisterData("test@test.com", "Iwona", "Moryc", "Test1234!"));
    emit(result);
  }
}
