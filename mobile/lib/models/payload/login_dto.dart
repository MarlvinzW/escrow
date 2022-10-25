import 'package:json_annotation/json_annotation.dart';

part 'impl/login_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginDto {
  String username;
  String password;

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  LoginDto({required this.username, required this.password});
}
