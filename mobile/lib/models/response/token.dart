import 'package:json_annotation/json_annotation.dart';

part 'impl/token.g.dart';

@JsonSerializable(explicitToJson: true)
class Token {
  String access;
  String accessTokenType;

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  factory Token.fromJson(Map<String, dynamic> json) =>
      _$TokenFromJson(json);

  Token({required this.access, required this.accessTokenType});
}
