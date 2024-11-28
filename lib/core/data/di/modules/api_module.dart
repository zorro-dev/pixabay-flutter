import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/data/api/interceptors/pixabay_auth_interceptor.dart';
import 'package:pixabay_flutter/core/data/api/schemes/api.dart';
import 'package:pixabay_flutter/core/data/api/schemes/test_api.dart';
import 'package:pixabay_flutter/core/data/api/api_constants.dart';
import 'package:pixabay_flutter/core/data/di/dependency_container.dart';
import 'package:pixabay_flutter/core/data/di/types.dart';

@module
abstract class ApiModule {
  @baseUrl
  @Injectable()
  String resolveBaseUrl() {
    String baseUrl = switch (currentEnvironment) {
      Environment.prod => ApiConstants.baseUrl,
      Environment.dev => ApiConstants.baseLocalUrlExternalDevice,
      Environment.test => ApiConstants.baseLocalUrlExternalDevice,
      _ => ApiConstants.baseLocalUrlExternalDevice,
    };

    return baseUrl;
  }

  @Singleton()
  Api resolveApi(Dio dio, @baseUrl String baseUrl) {
    return switch (currentEnvironment) {
      Environment.prod || Environment.dev => Api(dio, baseUrl: baseUrl),
      Environment.test => MockedApi(dio, baseUrl: baseUrl),
    _ => Api(dio, baseUrl: baseUrl),
    };
  }

  @injectable
  Dio resolveDio(PixabayAuthInterceptor pixabayAuthInterceptor) {
    BaseOptions options = BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60));

    final dio = Dio(options);

    dio.options.headers["Content-Type"] = "application/json";

    dio.interceptors.add(pixabayAuthInterceptor);

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        logPrint: (object) => developer.log(object.toString()),
      ),
    );

    return dio;
  }

  @injectable
  PixabayAuthInterceptor resolvePixabayAuthInterceptor() {
    final apiKey = dotenv.env['PIXABAY_API_KEY'];
    assert(apiKey != null && apiKey.isNotEmpty, 'PIXABAY_API_KEY is empty, please check .env PIXABAY_API_KEY=<your_api_key>');
    return PixabayAuthInterceptor(apiKey!);
  }

  @injectable
  http.Client get resolveHttpClient => http.Client();
}
