import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pixabay_flutter/core/domain/error/failures.dart';


class ErrorUtils {
  static Failure parseFailure(Response<dynamic>? response) {
    try {
      final json = jsonEncode(response?.data);

      final jsonDecoded = jsonDecode(json);

      if (jsonDecoded is List<dynamic>) {
        // final errors = jsonDecoded.map((e) => e.toString()).toList();
        // return ServerFailure(errors: errors);
      } else if (jsonDecoded is Map<String, dynamic>) {
        if (jsonDecoded.containsKey("message")) {
          final message = jsonDecoded["message"];
          if (message is List<dynamic>) {
            // final errors = message.map((e) => e.toString()).toList();
            // return ServerFailure(errors: errors);
          }
        }
      }

      return switch (response?.statusCode) {
        401 => UnauthorizedFailure(),
        404 => NotFoundFailure(),
        413 => RequestEntityTooLargeFailure(),
        500 => InternalFailure(),
        _ => InternalFailure.unknown(),
      };
    } catch (e, s) {
      if (kDebugMode) {
        print(s);
      }
      return InternalFailure.unknown();
    }
  }
}
