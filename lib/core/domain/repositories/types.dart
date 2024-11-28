import 'package:dartz/dartz.dart';
import 'package:pixabay_flutter/core/domain/error/failures.dart';

typedef RepositoryReturnType<T> = Future<Either<Failure, T>>;
typedef RepositoryStreamReturnType<T> = Stream<Either<Failure, T>>;