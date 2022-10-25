abstract class ExceptionHandlerService {
  void onAuthHttpException(
      {required Object httpException,
      required String loggerMessage,
      required bool dismissLoader});
}
