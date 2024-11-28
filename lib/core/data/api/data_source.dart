import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pixabay_flutter/core/domain/error/failures.dart';

import 'base_response.dart';
import 'failure_utils.dart';

typedef DataSourceReturnType<T> = Future<Either<Failure, T>>;

class DataSource {
  DataSource();

  DataSourceReturnType<T> baseResponse<T>(
      Future<BaseResponse<T>> Function() request) async {
    try {
      BaseResponse<T> result = await request();
      return Right(result.data as T);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.sendTimeout||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {

        return Left(TimeoutFailure());
      }

      return Left(ErrorUtils.parseFailure(e.response));
    }  catch (e, stacktrace) {
      if (kDebugMode) {
        print('While running getBaseResponse error caught: $e. $stacktrace');
      }

      return Left(InternalFailure.unknown());
    }
  }

  DataSourceReturnType<T> response<T>(
      Future<T> Function() request) async {
    try {
      T result = await request();
      return Right(result);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.sendTimeout||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {

        return Left(TimeoutFailure());
      }
      return Left(ErrorUtils.parseFailure(e.response));
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('While running getResponse error caught: $e. $stacktrace');
      }

      return Left(InternalFailure.unknown());
    }
  }
}
