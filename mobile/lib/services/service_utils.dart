import 'package:dio/dio.dart';
import 'package:escrow_mobile/services/api/user_service.dart';

abstract class ServiceUtils {
  Future<Dio> authClient();

  Future<UserService> userService();
}
