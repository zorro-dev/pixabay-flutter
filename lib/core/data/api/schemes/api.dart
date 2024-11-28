import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/data/di/types.dart';
import 'package:pixabay_flutter/features/pixabay/core/data/entities/response_get_pixabay_images.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

typedef BaseApi = _Api;

@RestApi()
abstract class Api {
  @factoryMethod
  factory Api(Dio dio, {@baseUrl required String baseUrl}) = _Api;

  @GET('/')
  Future<ResponseGetPixabayImages> search(@Queries() Map<String, dynamic> queries);
}
