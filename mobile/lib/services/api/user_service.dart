import 'package:dio/dio.dart';
import 'package:escrow_mobile/models/response/api_response.dart';
import 'package:escrow_mobile/utils/contstants.dart';
import 'package:retrofit/http.dart';
import 'package:escrow_mobile/models/payload/login_dto.dart';
import 'package:escrow_mobile/models/payload/user_dto.dart';
import 'package:escrow_mobile/models/response/auth_response.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @POST("public/auth/login")
  Future<AuthResponse> login(@Body() LoginDto dto);

  @POST("public/auth/register")
  Future<ApiResponse> register(@Body() UserDto dto);

}
