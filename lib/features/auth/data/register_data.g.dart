// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) {
  return RegisterData(
    json['email'] as String,
    json['firstName'] as String,
    json['lastName'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$RegisterDataToJson(RegisterData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
    };
