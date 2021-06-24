import 'package:injectable/injectable.dart';
import 'package:plantify/common/utils/handle_response.dart';
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
    Result<AuthEntity> result = await handleResponse<AuthResponse, AuthEntity>(
      () => apiClient.register(registerData),
      (AuthResponse response) => response.mapToEntity(),
    );
    return result;
  }
}
