// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
      firstName: json['firstName'] as String,
      username: json['username'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      roles: (json['roles'] as List<dynamic>)
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'username': instance.username,
      'lastName': instance.lastName,
      'email': instance.email,
      'location': instance.location.toJson(),
      'roles': instance.roles.map((e) => e.toJson()).toList(),
    };
