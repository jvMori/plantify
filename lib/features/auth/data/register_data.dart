import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_data.g.dart';

@JsonSerializable()
class RegisterData {
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  RegisterData(this.email, this.firstName, this.lastName, this.password);

  factory RegisterData.fromJson(Map<String, dynamic> json) => _$RegisterDataFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataToJson(this);
}
