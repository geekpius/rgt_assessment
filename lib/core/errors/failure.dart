
import 'package:equatable/equatable.dart';

import 'errors.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object?> get props => [];
}

class NoInternetFailure extends Failure {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'No internet';
}

class ServerFailure extends Failure {
  const ServerFailure({
    this.message = 'Something went wrong. Try again in a while.',
  });
  final String message;

  @override
  List<Object> get props => [message];
}

class TimeOutFailure extends Failure {
  const TimeOutFailure({
    this.message,
  });
  final String? message;

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Request Timeout';
}

class NullFailure extends Failure {
  @override
  List<Object> get props => [];
}

class FailureToMessage {
  static String mapFailureToMessage(Failure failure) {
    if (failure is NoInternetFailure) {
      return 'Please check your internet connection and try again.';
    }
    if (failure is ServerFailure) {
      return failure.message;
    }
    if (failure is TimeOutFailure) {
      return 'Opps! Your internet connection is slow. Check and try again.';
    }

    return 'Something went wrong. Try again in a while.';
  }


  static dynamic returnLeftError(Object e, [StackTrace? stack, dynamic reason]){
    if (e is NoInternetException) {
      return NoInternetFailure();
    }

    return  ServerFailure(message: e.toString());
  }


}


