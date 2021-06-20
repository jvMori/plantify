import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plantify/features/auth/presentation/bloc/result.dart';

part 'register_screen_state.dart';

class RegisterScreenCubit extends Cubit<Result> {
  RegisterScreenCubit() : super(Result());

  init() async {
    emit(Result.loading());
    await Future.delayed(Duration(seconds: 3));
    emit(Result<String>.success("Success"));
  }
}
