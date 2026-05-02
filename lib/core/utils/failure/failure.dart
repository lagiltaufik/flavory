sealed class Failure implements Exception {
  const Failure({required this.message});
  final String message;
}

class CancelledFailure extends Failure {
  const CancelledFailure() : super(message: "Вы отменили запрос!");
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super(message: "Проверьте подключение к интернету!");
}

class BadRequestFailure extends Failure {
  const BadRequestFailure() : super(message: "Некорректный запрос (400)");
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super(message: "Необходима авторизация (401)");
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: "Ошибка сервера (500)");
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure()
    : super(message: "Неизвестная ошибка, попробуйте еще раз");
}
