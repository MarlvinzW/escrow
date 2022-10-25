/*
    @author Marlvin Chihota
    Email marlvinchihota@gmail.com
    Created on 7/4/2022
*/
import 'package:escrow_mobile/models/payload/login_dto.dart';
import 'package:escrow_mobile/models/payload/user_dto.dart';
import 'package:escrow_mobile/models/response/api_response.dart';
import 'package:escrow_mobile/models/response/auth_response.dart';
import 'package:escrow_mobile/services/impl/exception_handler_service_impl.dart';
import 'package:escrow_mobile/services/impl/logger_service_impl.dart';
import 'package:escrow_mobile/services/impl/service_utils_impl.dart';
import 'package:escrow_mobile/services/user_api.dart';
import 'package:escrow_mobile/utils/contstants.dart';
import 'package:escrow_mobile/widgets/common/dialogs.dart';
import 'package:get/get.dart';

class UserApiImpl extends UserApi {
  // api utils
  final logger = LoggerServiceImpl();
  final utils = ServiceUtilsImpl();
  final errors = ExceptionHandlerServiceImpl();

  @override
  Future<AuthResponse?> login(LoginDto dto) async {
    // loader
    loadingDialog(text: 'Authenticating ...', color: Constants.appColor);

    AuthResponse? response;
    final service = await utils.userService();
    await service.login(dto).then((result) {
      response = result;
      // clear loader
      Get.back();
    }).catchError((Object errorObject) {
      response = null;
      // handle error response
      errors.onAuthHttpException(
          loggerMessage: 'Login Exception',
          dismissLoader: true,
          httpException: errorObject);
    });
    return Future.value(response);
  }

  @override
  Future<ApiResponse?> register(UserDto dto) async {
    // loader
    loadingDialog(
        text: 'Registering ${dto.username}', color: Constants.appColor);

    ApiResponse? response;
    final service = await utils.userService();
    await service.register(dto).then((result) {
      response = result;
      // clear loader
      Get.back();
    }).catchError((Object errorObject) {
      response = null;
      // handle error response
      errors.onAuthHttpException(
          loggerMessage: 'Registration Exception',
          dismissLoader: true,
          httpException: errorObject);
    });
    return Future.value(response);
  }
}
