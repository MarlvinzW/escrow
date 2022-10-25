// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => LocationDto(
      address: json['address'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
    );

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'province': instance.province,
    };
