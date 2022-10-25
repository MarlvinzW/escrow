// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRepository _$AuthRepositoryFromJson(Map<String, dynamic> json) =>
    AuthRepository(
      isAuthenticated: json['isAuthenticated'] as bool,
      auth: json['auth'] == null
          ? null
          : Auth.fromJson(json['auth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthRepositoryToJson(AuthRepository instance) =>
    <String, dynamic>{
      'isAuthenticated': instance.isAuthenticated,
      'auth': instance.auth?.toJson(),
    };
