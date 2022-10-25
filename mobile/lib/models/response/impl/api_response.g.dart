// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      successful: json['successful'] as bool,
      data: json['data'] as String,
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'data': instance.data,
    };
