import 'package:dio/dio.dart';
import 'package:escrow_mobile/services/api/user_service.dart';
import 'package:escrow_mobile/services/service_utils.dart';

class ServiceUtilsImpl extends ServiceUtils {
  Dio _getClient() {
    Dio client = Dio();
    client.options.headers['Content-Type'] = 'application/json';
    return client;
  }

  @override
  Future<Dio> authClient() async {
    Dio dio = _getClient();
    return dio;
  }

  @override
  Future<UserService> userService() async {
    final service = UserService(await authClient());
    return Future.value(service);
  }
}
