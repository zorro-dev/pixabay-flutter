import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/data/api/data_source.dart';
import 'package:pixabay_flutter/core/data/api/schemes/api.dart';
import 'package:pixabay_flutter/features/pixabay/core/data/entities/response_get_pixabay_images.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/usecases/get_pixabay_images_usecase.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/usecases/get_pixabay_item_usecase.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/usecases/search_pixabay_images_usecase.dart';

@injectable
class PixabayDataSource extends DataSource {
  final Api api;

  PixabayDataSource(this.api);

  DataSourceReturnType<ResponseGetPixabayImages> getPixabayImages(ParamsGetPixabayImages params) {
    return response(() => api.search(params.toJson()));
  }

  DataSourceReturnType<ResponseGetPixabayImages> getPixabayImage(ParamsGetPixabayImage params) {
    return response(() => api.search(params.toJson()));
  }

  DataSourceReturnType<ResponseGetPixabayImages> searchPixabayImages(ParamsSearchPixabayImages params) {
    return response(() => api.search(params.toJson()));
  }
}
