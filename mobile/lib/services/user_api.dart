import 'package:escrow_mobile/models/payload/login_dto.dart';
import 'package:escrow_mobile/models/payload/user_dto.dart';
import 'package:escrow_mobile/models/response/api_response.dart';
import 'package:escrow_mobile/models/response/auth_response.dart';

abstract class UserApi {
  Future<AuthResponse?> login(LoginDto dto);
  Future<ApiResponse?> register(UserDto dto);
}
