import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/domain/usecases/usecase.dart';
import 'package:pixabay_flutter/features/pixabay/core/data/entities/response_get_pixabay_images.dart';
import 'package:pixabay_flutter/features/pixabay/core/data/source/pixabay_data_source.dart';

@injectable
class GetPixabayImagesUsecase extends UseCase<ResponseGetPixabayImages, ParamsGetPixabayImages> {

  final PixabayDataSource dataSource;

  GetPixabayImagesUsecase(this.dataSource);

  @override
  UseCaseReturnType<ResponseGetPixabayImages> call(ParamsGetPixabayImages params) {
    return dataSource.getPixabayImages(params);
  }
}

class ParamsGetPixabayImages {

  final int page;
  final int limit;

  const ParamsGetPixabayImages({
    required this.page,
    required this.limit,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': this.page,
      'limit': this.limit,
    };
  }

  factory ParamsGetPixabayImages.fromJson(Map<String, dynamic> map) {
    return ParamsGetPixabayImages(
      page: map['page'] as int,
      limit: map['limit'] as int,
    );
  }
}