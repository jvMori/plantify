import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  Dio get dio {
    Dio instance = Dio(
      BaseOptions(
        connectTimeout: 6000,
      ),
    );
    instance.interceptors.add(LogInterceptor());
    return instance;
  }
}
