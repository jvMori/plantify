import 'dart:io';

import 'package:dio/dio.dart';
import 'package:plantify/features/auth/presentation/bloc/result.dart';

typedef Future Callback();

Future<Result<Entity>> handleResponse<ResponseType, Entity>(
    Callback callback, Entity Function(ResponseType) mapToEntity) async {
  try {
    ResponseType response = await callback();
    Entity entity = mapToEntity(response);
    return Result<Entity>.success(entity);
  } on DioError catch (e) {
    //TODO: refresh token if needed
    if (e.response?.data != null) return Result.error(e.response?.data['message']);
    return Result.error(e.message);
  } on SocketException {
    return Result.error('No Internet connection');
  } on HttpException catch (e) {
    return Result.error(e.message);
  } on FormatException {
    return Result.error("Bad response format");
  } catch (e, stacktrace) {
    print("Exception: $e, stacktrace: $stacktrace");
    return Result.error("Something went wrong");
  } finally {
    // code that should always execute; irrespective of the exception
  }
}
