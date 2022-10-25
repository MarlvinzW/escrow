// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      address: json['address'] as String,
      city: json['city'] as String,
      province: json['province'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'province': instance.province,
    };
