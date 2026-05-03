import 'package:dio/dio.dart';
import 'package:flavory/core/utils/failure/failure.dart';

class FailureInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    late Failure failure;

    if (err.type == DioExceptionType.cancel) {
      failure = const CancelledFailure();
    } else if (err.type == DioExceptionType.connectionError) {
      failure = const NetworkFailure();
    } else {
      final statusCode = err.response?.statusCode;

      switch (statusCode) {
        case 400:
          failure = const BadRequestFailure();
          break;
        case 401:
          failure = const UnauthorizedFailure();
          break;
        case 500:
          failure = const ServerFailure();
          break;
        case 402:
          failure = const QuotaExceededFailure();
        default:
          failure = const UnexpectedFailure();
      }
    }

    handler.reject(err.copyWith(error: failure));
  }
}
