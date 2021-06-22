import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:plantify/features/auth/data/auth_response.dart';
import 'package:plantify/features/auth/data/register_data.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';

@Singleton()
@RestApi(baseUrl: "https://plantify.dev/")
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST("auth/register")
  Future<AuthResponse> register(@Body() RegisterData registerData);
}
