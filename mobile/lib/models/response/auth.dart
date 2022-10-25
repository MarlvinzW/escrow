

import 'package:escrow_mobile/models/response/location.dart';
import 'package:escrow_mobile/models/response/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'impl/auth.g.dart';

@JsonSerializable(explicitToJson: true)
class Auth {
   String firstName;
   String username;
   String lastName;
   String email;
   Location location;
   List<Role> roles;

   Map<String, dynamic> toJson() => _$AuthToJson(this);

   factory Auth.fromJson(Map<String, dynamic> json) =>
       _$AuthFromJson(json);
   
   Auth({
      required this.firstName,
      required this.username,
      required this.lastName,
      required this.email,
      required this.location,
      required this.roles
});
}