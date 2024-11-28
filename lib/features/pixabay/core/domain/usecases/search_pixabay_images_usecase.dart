import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/domain/usecases/usecase.dart';
import 'package:pixabay_flutter/features/pixabay/core/data/entities/response_get_pixabay_images.dart';
import 'package:pixabay_flutter/features/pixabay/core/data/source/pixabay_data_source.dart';

@injectable
class SearchPixabayImagesUsecase extends UseCase<ResponseGetPixabayImages, ParamsSearchPixabayImages> {

  final PixabayDataSource dataSource;

  SearchPixabayImagesUsecase(this.dataSource);

  @override
  UseCaseReturnType<ResponseGetPixabayImages> call(ParamsSearchPixabayImages params) {
    return dataSource.searchPixabayImages(params);
  }
}

class ParamsSearchPixabayImages {

  final String query;
  final int page;
  final int limit;

  const ParamsSearchPixabayImages({
    required this.query,
    required this.page,
    required this.limit,
  });

  Map<String, dynamic> toJson() {
    return {
      'q': this.query,
      'page': this.page,
      'limit': this.limit,
    };
  }

  factory ParamsSearchPixabayImages.fromJson(Map<String, dynamic> map) {
    return ParamsSearchPixabayImages(
      query: map['q'] as String,
      page: map['page'] as int,
      limit: map['limit'] as int,
    );
  }
}