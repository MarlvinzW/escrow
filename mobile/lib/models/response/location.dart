import 'package:json_annotation/json_annotation.dart';

part 'impl/location.g.dart';

@JsonSerializable(explicitToJson: true)
class Location {
  String address;
  String city;
  String province;

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Location({required this.address, required this.city, required this.province});
}
