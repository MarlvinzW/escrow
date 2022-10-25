import 'package:escrow_mobile/models/payload/location_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'impl/user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDto {
  String username;
  String firstName;
  String lastName;
  String password;
  LocationDto location;

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  UserDto(
      {required this.username,
      required this.firstName,
      required this.lastName,
      required this.password,
      required this.location});
}
