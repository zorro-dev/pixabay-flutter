import 'package:dartz/dartz.dart';
import 'package:pixabay_flutter/core/domain/error/failures.dart';

typedef FailureOr<T> = Either<Failure, T>;

class NoParams {}