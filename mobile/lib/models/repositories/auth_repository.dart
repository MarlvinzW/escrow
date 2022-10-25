import 'package:escrow_mobile/models/response/auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_repository.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthRepository {
  bool isAuthenticated;
  Auth? auth;

  Map<String, dynamic> toJson() => _$AuthRepositoryToJson(this);

  factory AuthRepository.fromJson(Map<String, dynamic> json) =>
      _$AuthRepositoryFromJson(json);

  AuthRepository({required this.isAuthenticated, this.auth});
}
