import 'package:json_annotation/json_annotation.dart';

part 'impl/role.g.dart';

@JsonSerializable(explicitToJson: true)
class Role {
  String userRole;

  Map<String, dynamic> toJson() => _$RoleToJson(this);

  factory Role.fromJson(Map<String, dynamic> json) =>
      _$RoleFromJson(json);

  Role({required this.userRole});
}