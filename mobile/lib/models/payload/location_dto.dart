import 'package:json_annotation/json_annotation.dart';

part 'impl/location_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationDto {
  String address;
  String city;
  String province;

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  LocationDto(
      {required this.address, required this.city, required this.province});
}
