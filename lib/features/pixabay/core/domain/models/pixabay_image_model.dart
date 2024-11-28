import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixabay_image_model.g.dart';

@JsonSerializable()
class PixabayImageModel {
  final int id;

  @JsonKey(name: 'pageURL')
  final String? pageUrl;

  final String? type; // photo, ...

  @JsonKey(name: 'tags')
  final String? tagsString; // blossom, bloom, flower

  @JsonKey(name: 'previewURL')
  final String? previewUrl;

  final int? previewWidth;
  final int? previewHeight;

  @JsonKey(name: 'webformatURL')
  final String? webformatUrl;

  final int? webformatWidth;
  final int? webformatHeight;

  @JsonKey(name: 'imageURL')
  final String? imageUrl;

  final int? imageWidth;
  final int? imageHeight;

  final int? imageSize;

  final int? views;
  final int? downloads;
  final int? likes;
  final int? comments;

  @JsonKey(name: 'user_id')
  final int? userId;

  final String? user;

  @JsonKey(name: 'userImageURL')
  final String? userImageUrl;

  double? get ratioWH {
    final width = imageWidth;
    final height = imageHeight;

    if (width == null) return null;
    if (height == null) return null;

    return width / height;
  }

  double? get ratioHW {
    final width = imageWidth;
    final height = imageHeight;

    if (width == null) return null;
    if (height == null) return null;

    return height / width;
  }

  List<Size> get sizes {
    final imageWidth = this.imageWidth?.toDouble();
    final imageHeight = this.imageHeight?.toDouble();

    final webformatWidth = this.webformatWidth?.toDouble();
    final webformatHeight = this.webformatHeight?.toDouble();

    final previewWidth = this.previewWidth?.toDouble();
    final previewHeight = this.previewHeight?.toDouble();

    return [
      if (imageWidth != null && imageHeight != null) Size(imageWidth, imageHeight),
      if (webformatWidth != null && webformatHeight != null) Size(webformatWidth, webformatHeight),
      if (previewWidth != null && previewHeight != null) Size(previewWidth, previewHeight)
    ];
  }

  const PixabayImageModel({
    required this.id,
    required this.pageUrl,
    required this.type,
    required this.tagsString,
    required this.previewUrl,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatUrl,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageUrl,
  });

  factory PixabayImageModel.fromJson(Map<String, dynamic> json) => _$PixabayImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PixabayImageModelToJson(this);
}
