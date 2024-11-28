import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class BaseResponse<T> {
  BaseResponse({this.data, this.statusCode, this.message});

  int? statusCode;
  String? message;
  T? data;

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$BaseResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T) toJsonT) => _$BaseResponseToJson(this, toJsonT);
}
