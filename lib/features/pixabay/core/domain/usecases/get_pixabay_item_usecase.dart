import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/domain/usecases/usecase.dart';
import 'package:pixabay_flutter/features/pixabay/core/data/source/pixabay_data_source.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/models/pixabay_image_model.dart';

@injectable
class GetPixabayImageUsecase extends UseCase<PixabayImageModel?, ParamsGetPixabayImage> {
  final PixabayDataSource dataSource;

  GetPixabayImageUsecase(this.dataSource);

  @override
  UseCaseReturnType<PixabayImageModel?> call(ParamsGetPixabayImage params) async {
    return (await dataSource.getPixabayImage(params)).fold(
      (l) => Left(l),
      (r) => Right(r.hits.firstOrNull),
    );
  }
}

class ParamsGetPixabayImage {
  final int id;

  const ParamsGetPixabayImage({
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
    };
  }

  factory ParamsGetPixabayImage.fromJson(Map<String, dynamic> map) {
    return ParamsGetPixabayImage(
      id: map['id'] as int,
    );
  }
}
