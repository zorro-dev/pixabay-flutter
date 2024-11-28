import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_flutter/features/pixabay/core/domain/models/pixabay_image_model.dart';

part 'response_get_pixabay_images.g.dart';

@JsonSerializable()
class ResponseGetPixabayImages {
  final int total;
  final int totalHits;
  final List<PixabayImageModel> hits;

  ResponseGetPixabayImages(
    this.total,
    this.totalHits,
    this.hits,
  );

  factory ResponseGetPixabayImages.fromJson(Map<String, dynamic> json) => _$ResponseGetPixabayImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseGetPixabayImagesToJson(this);

}
