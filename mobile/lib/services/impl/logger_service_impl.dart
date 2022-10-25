/*
    @author Marlvin Chihota
    Email marlvinchihota@gmail.com
    Created on 9/4/2022
*/

import 'package:escrow_mobile/services/logger_service.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

class LoggerServiceImpl extends LoggerService {
  Logger logger = Logger();

  @override
  void payload({required Object payload}) {
    if (!kReleaseMode) {
      logger.i({'data': payload});
    }
  }

  @override
  void request({required String text, required Object payload}) {
    if (!kReleaseMode) {
      logger.i({'message': text, 'data': payload});
    }
  }
}
