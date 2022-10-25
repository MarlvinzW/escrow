// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      access: json['access'] as String,
      accessTokenType: json['accessTokenType'] as String,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'access': instance.access,
      'accessTokenType': instance.accessTokenType,
    };
