import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:pixabay_flutter/core/presentation/utils/intl_utils.dart';

class FailureType {
  final String id;

  const FailureType.internal() : id = "internal";

  const FailureType.notFound() : id = "notFound";

  const FailureType.unauthorized() : id = "unauthorized";

  const FailureType.timeout() : id = "timeout";

  const FailureType.parse() : id = "parse";

  const FailureType.entityTooLarge() : id = "entityTooLarge";

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is FailureType && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

abstract class Failure {
  final FailureType type;
  final int createdAt;

  Failure({
    required this.type,
  }) : createdAt = DateTime.now().millisecondsSinceEpoch;

  String message([BuildContext? context]);

  @override
  String toString() => '(createdAt: $createdAt; message: ${message()})';
}

class InternalFailure extends Failure {
  final String? reason;

  InternalFailure({this.reason}) : super(type: const FailureType.internal());

  InternalFailure.unknown()
      : reason = 'unknown',
        super(type: const FailureType.internal());

  @override
  String message([BuildContext? context]) {
    final message = intlMessage(
      context,
      localized: (s) => s.internalFailure,
      orElse: type.id,
    );
    return [message, reason].whereNotNull().join("\n");
  }
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure() : super(type: const FailureType.unauthorized());

  @override
  String message([BuildContext? context]) {
    return intlMessage(
      context,
      localized: (s) => s.timeoutFailure,
      orElse: type.id,
    );
  }
}

class TimeoutFailure extends Failure {
  TimeoutFailure() : super(type: const FailureType.timeout());

  @override
  String message([BuildContext? context]) {
    return intlMessage(
      context,
      localized: (s) => s.timeoutFailure,
      orElse: type.id,
    );
  }
}

class RequestEntityTooLargeFailure extends Failure {
  RequestEntityTooLargeFailure() : super(type: const FailureType.entityTooLarge());

  @override
  String message([BuildContext? context]) {
    return intlMessage(
      context,
      localized: (s) => s.entityTooLargeFailure,
      orElse: type.id,
    );
  }
}

class NotFoundFailure extends Failure {
  NotFoundFailure() : super(type: const FailureType.notFound());

  @override
  String message([BuildContext? context]) {
    return intlMessage(
      context,
      localized: (s) => s.notFoundFailure,
      orElse: type.id,
    );
  }
}
