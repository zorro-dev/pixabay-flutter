import 'package:dio/dio.dart';

class PixabayAuthInterceptor extends Interceptor {

  final String pixabayApiKey;

  PixabayAuthInterceptor(this.pixabayApiKey);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters["key"] = pixabayApiKey;
    handler.next(options);
  }

}