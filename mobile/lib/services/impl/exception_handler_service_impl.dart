/*
    @author Marlvin Chihota
    Email marlvinchihota@gmail.com
    Created on 9/5/2022
*/

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:escrow_mobile/bloc/events/snack_bar_actions.dart';
import 'package:escrow_mobile/models/response/api_response.dart';
import 'package:escrow_mobile/services/exception_handler_service.dart';
import 'package:escrow_mobile/services/impl/logger_service_impl.dart';
import 'package:escrow_mobile/utils/contstants.dart';
import 'package:escrow_mobile/widgets/common/dialogs.dart';
import 'package:get/get.dart';

class ExceptionHandlerServiceImpl implements ExceptionHandlerService {
  // logger
  final LoggerServiceImpl logger = LoggerServiceImpl();

  @override
  void onAuthHttpException(
      {required Object httpException,
      required String loggerMessage,
      required bool dismissLoader}) {
    final res = (httpException as DioError).response;

    // error response
    logger.request(text: loggerMessage, payload: res ?? '');

    // close loader
    if (dismissLoader) {
      Get.back();
    }

    // handle network issues -> res = null

    if (res != null) {
      // handle exception and notify user
      if (res.statusCode == Constants.badRequestCode ||
          res.statusCode == Constants.notFoundCode) {
        ApiResponse errorResponse =
            ApiResponse.fromJson(json.decode(res.toString()));
        snackBar(message: errorResponse.data, action: SnackBarActions.success);
      } else {
        snackBar(
            message: Constants.connectionError, action: SnackBarActions.error);
      }
    }

    // network issue / bad connection / server down
    else {
      snackBar(
          message: Constants.connectionError, action: SnackBarActions.error);
    }
  }
}
