import 'package:injectable/injectable.dart';
import 'package:plantify/features/auth/data/auth_api.dart';
import 'package:plantify/features/auth/data/auth_response.dart';
import 'package:plantify/features/auth/data/register_data.dart';
import 'package:plantify/features/auth/presentation/bloc/result.dart';

import 'auth_entity.dart';

abstract class AuthRepository {
  Future<Result<AuthEntity>> register(RegisterData registerData);
}

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApiClient apiClient;

  AuthRepositoryImpl(this.apiClient);

  @override
  Future<Result<AuthEntity>> register(RegisterData registerData) async {
    try {
      final AuthResponse result = await apiClient.register(registerData);
      return Result<AuthEntity>.success(result.mapToEntity());
    } catch (e) {
      return Result<AuthEntity>.error("Something went wrong!");
    }
  }
}
