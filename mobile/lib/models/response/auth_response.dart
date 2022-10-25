import 'package:escrow_mobile/models/response/auth.dart';
import 'package:escrow_mobile/models/response/token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'impl/auth_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthResponse {
  Auth user;
  Token token;

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  AuthResponse({required this.user, required this.token});
}
