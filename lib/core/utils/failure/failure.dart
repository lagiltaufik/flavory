sealed class Failure implements Exception {
  const Failure({required this.message});
  final String message;
}

class CancelledFailure extends Failure {
  const CancelledFailure() : super(message: "You canceled the request");
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super(message: "No internet connection!");
}

class BadRequestFailure extends Failure {
  const BadRequestFailure() : super(message: "Invalid request (400)");
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super(message: "Authorization required (401)");
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: "Server error (500)");
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure()
    : super(message: "Unknown error. Please, try again");
}

class QuotaExceededFailure extends Failure {
  const QuotaExceededFailure()
    : super(message: "Daily API limit reached. Try again tomorrow.");
}
