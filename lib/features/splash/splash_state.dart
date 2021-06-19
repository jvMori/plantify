part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}
class SplashStartLoading extends SplashState {}
class SplashLoaded extends SplashState {}
