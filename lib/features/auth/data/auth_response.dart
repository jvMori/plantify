import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plantify/features/auth/domain/auth_entity.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final String token;
  final String refreshToken;

  AuthResponse(this.token, this.refreshToken);

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

extension Mapping on AuthResponse {
  AuthEntity mapToEntity() => AuthEntity(token, refreshToken);
}
